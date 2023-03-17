# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Eric Le Lay <contact at elelay dot fr>

pkgname=ansifilter
pkgver=2.19
pkgrel=1
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64' 'pentium4' 'i486')
url="http://www.andre-simon.de/doku/ansifilter/en/ansifilter.php"
license=('GPL3')
depends=('glibc' 'gcc-libs')
options=(!debug)
source=("http://www.andre-simon.de/zip/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('f9c27b1883914a1b1d4965f4c49b2be502e2a9fc9dd3f61123abeae989c354bc')

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
