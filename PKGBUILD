# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=anymeal
pkgver=1.1
pkgrel=1
pkgdesc='A recipe database software'
arch=('x86_64')
url='https://wedesoft.github.io/anymeal'
license=('GPL3')
depends=('hicolor-icon-theme'
         'recode'
         'qt5-webkit')
makedepends=('qt5-base'
             'recode'
             'googletest')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/wedesoft/anymeal/archive/v${pkgver}.tar.gz")
sha256sums=('955852e050d7fe8810aed95088490e3b05cc3d9d4484efb612dc4b5cecefac40')

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: