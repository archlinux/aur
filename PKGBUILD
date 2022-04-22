# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libmediawiki
pkgver=5.37.0
pkgrel=3
pkgdesc="A KDE C++ interface for MediaWiki based web service as wikipedia.org"
arch=(x86_64)
url='https://www.digikam.org/'
license=(GPL)
depends=(kcoreaddons)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('da167259c49d012359ad65175c365613f0c42699fb99ac7fb9d1f1c8c48292c1'
            'SKIP')
validpgpkeys=(7C35920F1CE2899E8EA9AAD02E7C0367B9BFA089) # Scarlett Clark <sgclark@kde.org>

prepare() {
  mkdir -p build 
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
