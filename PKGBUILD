# Maintainer: Thomas Wood <grand.edgemaster@gmail.com>
pkgname=twemoji-color-font
pkgver=1.0_alpha
pkgrel=1
pkgdesc="A color and B&W emoji SVG-in-OpenType font with support for ZWJ, skin tone modifiers and country flags."
arch=('any')
url="https://github.com/eosrei/twemoji-color-font"
license=('custom:CCPL:by-4.0' 'MIT')

depends=(fontconfig)

_pkgver=${pkgver//_/-}

source=(
  "https://github.com/eosrei/$pkgname/releases/download/v${_pkgver}/TwitterColorEmoji-SVGinOT-${_pkgver}.zip"
  "https://raw.githubusercontent.com/eosrei/$pkgname/v${_pkgver}/LICENSE-CC-BY.txt"
  "https://raw.githubusercontent.com/eosrei/$pkgname/v${_pkgver}/LICENSE-MIT.txt"
  "https://raw.githubusercontent.com/eosrei/$pkgname/v${_pkgver}/README.md"
  "35-twemoji-color-font.conf"
)
install=$pkgname.install

package() {
  install -Dm644 TwitterColorEmoji-SVGinOT.ttf -t "$pkgdir"/usr/share/fonts/"Twitter Color Emoji"/
  install -Dm644 LICENSE-CC-BY.txt LICENSE-MIT.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 35-emojione-color-font.conf -t "$pkgdir"/etc/fonts/conf.avail/
}

md5sums=('dd2bd825b0c35406ec6b543747add9ab'
         'f9abd81f3f1621050749538a6b0781c4'
         '12999d68ce1129a4063665e382d130cc'
         '0cb44f8aa6d10516ae675524ccb0dc28'
         '96c7a296c17e7b66c556f4998354eb28')
