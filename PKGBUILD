# maintainer: Lara Maia <dev@lara.monster>

pkgname=colordf
pkgdesc="Colored and configurable version of df"
url="https://github.com/Calendulish/$pkgname"
pkgver=1.0
pkgrel=2
license=('GPLv2')
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
makedepends=('util-linux-libs' 'cmake')
source=("https://github.com/Calendulish/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('50626f0ed82303f6968f6806cad6e943f24616a36ad945c243a1b2866ab141cd')

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

