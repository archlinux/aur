# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=breeze-plymouth
pkgver=5.12.0
pkgrel=1
pkgdesc="Breeze theme for plymouth"
arch=(any)
url='https://projects.kde.org/breeze-plymouth'
license=(LGPL)
depends=(plymouth)
makedepends=(extra-cmake-modules)
source=("http://download.kde.org/stable/plasma/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('2f9c47e4121df3fb0e74cd18481981c2c8473eb911685ff96a457c24e1319fb5'
            'SKIP')
validpgpkeys=('1FA881591C26B276D7A5518EEAAF29B42A678C20')

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
