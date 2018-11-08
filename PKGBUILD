# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=librepcb
pkgver=0.1.0_rc2
_pkgver=${pkgver/_/-}
pkgrel=3
pkgdesc="A free EDA software to develop printed circuit boards."
arch=('x86_64' 'i686')
url="http://librepcb.org/"
license=('GPL')
depends=('desktop-file-utils' 'shared-mime-info' )
depends=('desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme' 'qt5-base' 'openssl' 'zlib')
provides=('librepcb')
conflicts=('librepcb-git' 'librepcb-appimage')
source=(
  "https://download.librepcb.org/releases/${_pkgver}/librepcb-${_pkgver}-source.zip"
  "https://download.librepcb.org/releases/${_pkgver}/librepcb-${_pkgver}-source.zip.asc"
)
sha256sums=(
  '0299971bc18d3cc5659e92b466c1950cd7c3c2d993ca04bd2e493a2827aa55e6'
  'SKIP'
)
validpgpkeys=('D6F9AF572228C5BCD6B538407EF3061F5C8D5E25')

build() {
  cd "${srcdir}/librepcb-${_pkgver}/"
  rm -rf build
  mkdir build && cd build
  qmake -r ../librepcb.pro PREFIX=${pkgdir}/usr
  make
}

package() {
  cd "${srcdir}/librepcb-${_pkgver}/build/"
  make install
}

# vim:set ts=2 sw=2 et:
