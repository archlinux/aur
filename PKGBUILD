# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname='json2tsv'
pkgver=0.8
pkgrel=1
pkgdesc='JSON to TSV converter'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://codemadness.org/json2tsv.html'
_url_source='https://codemadness.org/releases/json2tsv'
license=('ISC')
depends=('glibc')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ccc52e1963b4322ca56499ea62136fd75e2612b5fe833135675b7988fb4a7f37')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
