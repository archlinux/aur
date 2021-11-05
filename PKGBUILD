# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=restclient-cpp-git
pkgver=0.5.2.r24.gb782bd2
pkgrel=1
pkgdesc="A simple REST client for C++"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/mrtazz/restclient-cpp"
license=('MIT')
depends=('curl')
provides=('restclient-cpp')
conflicts=('restclient-cpp')
options=()
source=('git+https://github.com/mrtazz/restclient-cpp.git')
b2sums=('SKIP')

pkgver() {
    cd restclient-cpp
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd restclient-cpp
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd restclient-cpp
    make DESTDIR="$pkgdir/" install
}
