# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname='json2tsv'
pkgver=1.2
pkgrel=1
pkgdesc='JSON to TSV converter'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://codemadness.org/json2tsv.html'
_url_source='https://codemadness.org/releases/json2tsv'
license=('ISC')
depends=('sh' 'awk')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('113e5a7aeb295e7f8135f231cad900091f99aebd6c98316f761d377e9b50fd84')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
