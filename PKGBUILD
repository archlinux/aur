# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname='json2tsv'
pkgver=0.9
pkgrel=1
pkgdesc='JSON to TSV converter'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://codemadness.org/json2tsv.html'
_url_source='https://codemadness.org/releases/json2tsv'
license=('ISC')
depends=('glibc')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2a8186115693855f0aef422171e36ed509d2588707377583adb75d001524a9a9')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
