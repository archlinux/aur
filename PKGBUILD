# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sfeed
pkgver=0.9.23
pkgrel=1
pkgdesc='RSS and Atom parser'
arch=('any')
url='https://codemadness.org/sfeed-simple-feed-parser.html'
_url_source='https://codemadness.org/releases/sfeed'
license=('ISC')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0d7c48f8eee3949222a5d45f69bd2ac04ac03d93fe7678fcd4d2115a0aa3607d')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
