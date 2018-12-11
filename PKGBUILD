# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Eric Le Lay <contact at elelay dot fr>

pkgname=ansifilter
pkgver=2.12
pkgrel=1
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64')
url="http://www.andre-simon.de/doku/ansifilter/en/ansifilter.php"
license=('GPL3')
depends=('gcc-libs')
source=("http://www.andre-simon.de/zip/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('a01c36f515711019a0cdf495056ea68ab500d4325cf5d66fd28182d443615b6b')

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
