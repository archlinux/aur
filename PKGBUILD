# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=librepcb
pkgver=0.1.0_rc1
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A free EDA software to develop printed circuit boards."
arch=('x86_64' 'i686')
url="http://librepcb.org/"
license=('GPL')
depends=('desktop-file-utils' 'shared-mime-info' )
depends=('desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme' 'qt5-base' 'openssl' 'zlib')
provides=('librepcb')
conflicts=('librepcb-git' 'librepcb-appimage')
source=("https://download.librepcb.org/releases/${_pkgver}/librepcb-${_pkgver}-source.zip")
sha256sums=('355063a50bb8792be520b21c0f2ce94767a6a7e1fd5e8dc24e6028b2874a620e')

build() {
  cd "${srcdir}/librepcb-${_pkgver}/"
  mkdir build && cd build
  qmake -r ../librepcb.pro PREFIX=${pkgdir}/usr
  make
}

package() {
  cd "${srcdir}/librepcb-${_pkgver}/build/"
  make install
}

# vim:set ts=2 sw=2 et:
