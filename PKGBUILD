# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Eric Le Lay <contact at elelay dot fr>

pkgname=ansifilter
pkgver=2.13
pkgrel=1
pkgdesc="remove or convert ANSI codes to another format"
arch=('i686' 'x86_64')
url="http://www.andre-simon.de/doku/ansifilter/en/ansifilter.php"
license=('GPL3')
depends=('gcc-libs')
source=("http://www.andre-simon.de/zip/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('4022e6d763512cbbadc47264266c8796ee654ebd2f43daca4599d1f0281812c0')

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
