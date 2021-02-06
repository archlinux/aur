# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Eric Le Lay <contact at elelay dot fr>

pkgname=ansifilter
pkgver=2.18
pkgrel=1
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64' 'pentium4' 'i486')
url="http://www.andre-simon.de/doku/ansifilter/en/ansifilter.php"
license=('GPL3')
depends=('gcc-libs')
source=("http://www.andre-simon.de/zip/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('66cf017d36a43d5f6ae20609ce3b58647494ee6c0e41fc682c598bffce7d7d39')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/share/doc/ansifilter/COPYING" \
     "${pkgdir}/usr/share/doc/ansifilter/INSTALL"
}
