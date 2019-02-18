# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-pass
pkgver=1.0.0
pkgrel=1
arch=(x86_64)
pkgdesc="Plasma applet for the Pass password manager"
url="https://www.dvratil.cz/2018/05/plasma-pass/"
license=(GPL)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('9821c5ad80e4370dce002855bd0300d234feec249258b01fafd9e3a9241cbc66'
            'SKIP')
validpgpkeys=('0ABDFA55A4E6BEA99A83EA974D69557AECB13683') # Daniel Vrátil <dvratil@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
   -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}
