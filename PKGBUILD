# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>

pkgname='xml2tsv'
pkgver=0.1
pkgrel=1
pkgdesc='XML to TSV converter'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://git.katolaz.net/xml2tsv/tree/README.md'
_url_source='ftp://bitreich.org/releases/xml2tsv'
license=('ISC')
source=("${_url_source}/${pkgname}-${pkgver}.tgz")
sha512sums=('31f049bbfbcec484d85fe05157fb8b24f0b0eaf7cc145f704d7b762d0b974dedb9a46031a783f4d3e91cfa5b871c5f8bd25eafcc8638372ed91250675d15bb0b')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
