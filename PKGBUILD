# vim:set ts=2 sw=2 et:
#
# Maintainer: Tblue <tilman (at) ax86 (dot) net>
# Contributor: Schnouki <thomas.jost@gmail.com>

pkgname=mkbold-mkitalic
pkgver=0.11
pkgrel=2
pkgdesc="Make X11 BDF fonts bold and/or italic"
url="http://hp.vector.co.jp/authors/VA013651/freeSoftware/mkbold-mkitalic.html"
license=("custom:X11")
source=("http://hp.vector.co.jp/authors/VA013651/lib/${pkgname}-${pkgver}.tar.bz2")
arch=(i686 x86_64)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"

  make prefix="/usr" DESTDIR="${pkgdir}" install
}

md5sums=('2384f0eb2e0d2d8f70ee292b81522619')
sha384sums=('d4b2369ab90c3105873055f0f240f70daea8b713279172b9e28d51b9b7d6aacfcdb856a989ef60f3a5cbcec6f83066f7')
