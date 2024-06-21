# maintainer: Lara Maia <dev@lara.monster>

pkgname=colordf
pkgdesc="Colored and configurable version of df"
url="https://github.com/Calendulish/$pkgname"
pkgver=1.0
pkgrel=1
license=('GPLv2')
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
makedepends=('util-linux-libs' 'cmake')
source=("https://github.com/Calendulish/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('39d14fcd96050bf920c7ff130e8e4b84fbf70dd82a0be8ba8b826dc87ff1776c')

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

