# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=breeze-plymouth
pkgver=5.6.5
pkgrel=1
pkgdesc="Breeze theme for plymouth"
arch=(any)
url='https://projects.kde.org/breeze-plymouth'
license=(LGPL)
depends=(plymouth)
makedepends=(extra-cmake-modules)
source=("http://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('57328155ac14bb660ac0af2b676720635e4c9d5113cc81485272516fc4d85215')

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
