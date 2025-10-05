# Maintainer: kupira <skupira27@gmail.com>
pkgname=bluerice
pkgver=0.3.0
pkgrel=1
pkgdesc="Bluetooth utility with customizable menu"
arch=('x86_64')
makedepends=('git' 'cmake' 'make')
depends=('glib2' 'libnotify' 'bluez')
license=('MIT')
source=("git+https://github.com/kupira/BlueRice.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/BlueRice" || return 1
    mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/BlueRice/build" || return 1
    install -Dm755 bluerice "$pkgdir/usr/bin/bluerice"
}

