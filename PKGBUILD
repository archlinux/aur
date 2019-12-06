# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-pass
pkgver=1.1.0
pkgrel=1
arch=(x86_64)
pkgdesc="Plasma applet for the Pass password manager"
url="https://www.dvratil.cz/2018/05/plasma-pass/"
license=(GPL)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('a9789142c1b487f41e245bde9179d7857972c521df906e58176e0b0c0c3cdc39'
            'SKIP')
validpgpkeys=('0ABDFA55A4E6BEA99A83EA974D69557AECB13683') # Daniel Vrátil <dvratil@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}
