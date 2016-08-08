# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=breeze-plymouth
pkgver=5.7.3
pkgrel=1
pkgdesc="Breeze theme for plymouth"
arch=(any)
url='https://projects.kde.org/breeze-plymouth'
license=(LGPL)
depends=(plymouth)
makedepends=(extra-cmake-modules)
source=("http://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('ea8f5a5c23fc0b7945f920a76b0acbece1f579320bacc4492a2fda8cdb663a42')

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
