pkgname=mcstatus
pkgver=git
pkgrel=1
pkgdesc="A Minecraft server status probing library"
arch=('x86_64' 'i686')
url="https://github.com/MoeLeak/mcstatus"
license=('MIT')
depends=('cmake' 'boost' 'clang')
#install=mcstatus.install
source=("$pkgname::git+https://github.com/MoeLeak/mcstatus.git")
md5sums=('SKIP')

build() {
    cd $pkgname
    cmake .
    make
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir/" install
}
