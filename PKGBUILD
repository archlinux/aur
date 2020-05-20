# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=json2tsv
pkgver=0.5
pkgrel=1
pkgdesc="JSON to TSV converter"
arch=('x86_64')
url="https://codemadness.org/json2tsv.html"
license=('custom:ISC license')
source=("https://codemadness.org/releases/json2tsv/json2tsv-${pkgver}.tar.gz")
depends=('glibc')
makedepends=('gcc-libs')
provides=('json2tsv')
conflicts=('json2tsv')
sha256sums=('0e919ff3ecd4eed8d1209e1da0bb6d4c4099b276168a941b8bceecfe128e1fc5')

build() {
  cd "json2tsv-${pkgver}"
  make
}

package() {
  cd "json2tsv-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" MANPREFIX="/usr/share/man" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}