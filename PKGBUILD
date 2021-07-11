# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=sfeed
pkgver=0.9.25
pkgrel=1
pkgdesc='RSS and Atom parser'
arch=('any')
url='https://codemadness.org/sfeed-simple-feed-parser.html'
_url_source='https://codemadness.org/releases/sfeed'
license=('ISC')
depends=('sh')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a3d4a95bd660b6df4b7adaaecc7438fdb8ddd390b5d7e13fd14c2aeae1e2220a')

build() {
  make SFEED_CPPFLAGS="-D_DEFAULT_SOURCE" -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
