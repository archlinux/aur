# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=libacpi
pkgver=0.2
pkgrel=4
pkgdesc="general purpose lib to gather ACPI data"
arch=('x86_64' 'i686')
url="http://www.ngolde.de/libacpi.html"
license=('GPL')
depends=()
options=(!emptydirs)
source=(http://www.ngolde.de/download/${pkgname}-${pkgver}.tar.gz
	http://ftp.de.debian.org/debian/pool/main/liba/libacpi/libacpi_${pkgver}-4.diff.gz)
md5sums=('05b53dd7bead66dda35fec502b91066c'
         '30ecd3c281dfe7e11670618fdd8e3c5b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 <"$srcdir"/libacpi_${pkgver}-4.diff
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
