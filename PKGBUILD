# Maintainer: Ricardo Leuck <leuck.r at gmail>
pkgname=brewtarget
pkgver=2.3.0
pkgrel=1
pkgdesc="Beer calculator compatible with BeerSmith. Generates instructions from the recipe and interactive mash designer."
url="http://www.brewtarget.org/"
arch=('x86_64' 'i686')
license=('GPL3'
         'WTFPL-2')
depends=('qt5-tools' 'qt5-multimedia' 'qt5-svg' 'phonon')
optdepends=()
makedepends=('cmake')
conflicts=("${pkgname}-git")
backup=()
source=("${pkgname}-${pkgver}.zip"::"https://github.com/Brewtarget/${pkgname}/archive/v${pkgver}.zip")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING.GPLv3 "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.GPLv3"
}
