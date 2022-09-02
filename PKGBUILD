# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname='json2tsv'
pkgver=1.0
pkgrel=1
pkgdesc='JSON to TSV converter'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://codemadness.org/json2tsv.html'
_url_source='https://codemadness.org/releases/json2tsv'
license=('ISC')
depends=('sh' 'awk')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('04e6a60d6b33603a8a19d28e94038b63b17d49c65a0495cd761cf7f22616de9b')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
