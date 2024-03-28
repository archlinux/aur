# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname='json2tsv'
pkgver=1.1
pkgrel=1
pkgdesc='JSON to TSV converter'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://codemadness.org/json2tsv.html'
_url_source='https://codemadness.org/releases/json2tsv'
license=('ISC')
depends=('sh' 'awk')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('eebe7e6286558af0aa0db7c552a4c1ff1e350eb662ec665155c2611990a9c34a')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
