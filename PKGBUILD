pkgname=emojione-color-font
pkgver=1.0_beta
pkgrel=2
pkgdesc="A color and B&W emoji SVG-in-OpenType font with support for ZWJ, skin tone modifiers and country flags."
arch=('any')
url="https://github.com/eosrei/emojione-color-font"
license=('custom')

depends=(fontconfig)

source=(
  "https://github.com/eosrei/$pkgname/releases/download/v${pkgver//_/-}/EmojiOneColor-SVGinOT.ttf.zip"
  "https://raw.githubusercontent.com/eosrei/$pkgname/v${pkgver//_/-}/LICENSE-CC-BY.txt"
  "https://raw.githubusercontent.com/eosrei/$pkgname/v${pkgver//_/-}/README.md"
  "LICENSE"
  "35-emojione-color-font.conf"
)
install=$pkgname.install

package() {
  install -Dm644 EmojiOneColor-SVGinOT.ttf "$pkgdir"/usr/share/fonts/"Emoji One Color"/EmojiOneColor.ttf
  install -Dm644 LICENSE LICENSE-CC-BY.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname/
  install -Dm644 35-emojione-color-font.conf -t "$pkgdir"/etc/fonts/conf.avail/
}

md5sums=('f015fe9cbb154ff8af97b22345d765b9'
         'f9abd81f3f1621050749538a6b0781c4'
         '0ce2a75dc1457f6567bef021af4fb907'
         '6b3b659324c0aa9c562b50d166e16a5e'
         '96c7a296c17e7b66c556f4998354eb28')
