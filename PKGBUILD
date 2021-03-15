# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sfeed
pkgver=0.9.22
pkgrel=1
pkgdesc='RSS and Atom parser'
arch=('any')
url='https://codemadness.org/sfeed-simple-feed-parser.html'
_url_source='https://codemadness.org/releases/sfeed'
license=('ISC')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1941851adb7296dcd3e983575855fc8a4926fbd4e9d31220698f33ddca7f19ef')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
