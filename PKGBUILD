# Maintainer: Thomas Wood <grand.edgemaster@gmail.com>
pkgname=emojione-color-font
pkgver=1.0_beta2
pkgrel=1
pkgdesc="A color and B&W emoji SVG-in-OpenType font with support for ZWJ, skin tone modifiers and country flags."
arch=('any')
url="https://github.com/eosrei/emojione-color-font"
license=('custom')

depends=(fontconfig)

_pkgver=${pkgver//_/-}

source=(
  "https://github.com/eosrei/$pkgname/releases/download/v${_pkgver}/EmojiOneColor-SVGinOT-${_pkgver}.zip"
  "https://raw.githubusercontent.com/eosrei/$pkgname/v${_pkgver}/LICENSE.md"
  "https://raw.githubusercontent.com/eosrei/$pkgname/v${_pkgver}/LICENSE-CC-BY.txt"
  "https://raw.githubusercontent.com/eosrei/$pkgname/v${_pkgver}/README.md"
  "35-emojione-color-font.conf"
)
install=$pkgname.install

package() {
  install -Dm644 EmojiOneColor-SVGinOT.ttf -t "$pkgdir"/usr/share/fonts/"Emoji One Color"/
  install -Dm644 LICENSE.md LICENSE-CC-BY.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 35-emojione-color-font.conf -t "$pkgdir"/etc/fonts/conf.avail/
}

md5sums=('2156fb35365a6a2409479ebddf720b74'
         'ebfbb49903c99198d0184142a9eace49'
         'f9abd81f3f1621050749538a6b0781c4'
         '121a9a99be207d5b807c4341e499b145'
         '96c7a296c17e7b66c556f4998354eb28')
