# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='json2tsv'
pkgver=0.5
pkgrel=2
pkgdesc='JSON to TSV converter'
arch=('x86_64')
url='https://codemadness.org/json2tsv.html'
_url_source='https://codemadness.org/releases/json2tsv'
license=('ISC')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0e919ff3ecd4eed8d1209e1da0bb6d4c4099b276168a941b8bceecfe128e1fc5')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
