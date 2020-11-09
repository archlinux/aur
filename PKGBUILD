# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='sfeed'
pkgver=0.9.20
pkgrel=1
pkgdesc='RSS and Atom parser'
arch=('x86_64')
url='https://codemadness.org/sfeed-simple-feed-parser.html'
_url_source='https://codemadness.org/releases/sfeed'
license=('ISC')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2451457a7745ea8519316315a8597331302e00778a9ff7bec58dfb241674d991')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
