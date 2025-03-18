# Maintainer:

## links
# http://www.stixfonts.org
# https://github.com/stipub/stixfonts

_fontname="stix"
_pkgname="otf-$_fontname"
pkgbase="$_pkgname"
pkgname=(
  otf-stix
  ttf-stix-variable
)
pkgver=2.13.b171
pkgrel=2
pkgdesc="OpenType Unicode fonts for Scientific, Technical, and Mathematical texts"
url="https://github.com/stipub/stixfonts"
license=('OFL-1.1-RFN')
arch=('any')

source=(
  "$_fontname-otf-static-$pkgver.zip"::"$url/raw/v${pkgver//.b/b}/zipfiles/static_otf.zip"
  "$_fontname-ttf-variable-$pkgver.zip"::"$url/raw/v${pkgver//.b/b}/zipfiles/variable_ttf.zip"
  "$_fontname-license-$pkgver.txt"::"$url/raw/v${pkgver//.b/b}/OFL.txt"
)
sha256sums=(
  'b5ec34636e117ec97e71e6b89ad2718618184329bbb3d3be5d1e3b0f8ed52789'
  'd567c6c9a899665744e08391daeee1adbf039e109b10309855321b6c1a8f8acd'
  '0c8825913b60d858aacdb33c4ca6660a7d64b0d6464702efbb19313f5765861a'
)

package_otf-stix() {
  install -Dm644 static_otf/*.otf -t "$pkgdir/usr/share/fonts/$_fontname/"
  install -Dm644 "$_fontname-license-$pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-stix-variable() {
  install -Dm644 variable_ttf/*.ttf -t "$pkgdir/usr/share/fonts/$_fontname/"
  install -Dm644 "$_fontname-license-$pkgver.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
