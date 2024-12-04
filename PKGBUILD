# maintainer: Lara Maia <dev@lara.monster>

pkgname=colordf
pkgdesc="Colored and configurable version of df"
url="https://github.com/Calendulish/$pkgname"
pkgver=1.1
pkgrel=1
license=('GPLv2')
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
makedepends=('util-linux-libs' 'cmake')
source=("https://github.com/Calendulish/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('181decf4a0d492f0dc0182e834b1255a28e1c07a68d9ad3b71a9fdc4dfce699e')

build() {
    cd $pkgname-$pkgver
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd $pkgname-$pkgver/build
    install -Dm755 colordf $pkgdir/usr/bin/colordf
}

