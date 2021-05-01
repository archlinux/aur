# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-serif-classic-fonts
pkgver=1.001
pkgrel=7
pkgdesc='Adobe Source Han Serif fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-serif-classic"
license=('custom:OFL')
_sha512sums=$(curl -s -L https://github.com/redchenjs/source-han-serif-classic/releases/download/$pkgver/SourceHanSerifC-OTF.zip.sha512sum)
source=($_sha512sums.zip::"https://github.com/redchenjs/source-han-serif-classic/releases/download/$pkgver/SourceHanSerifC-OTF.zip")
sha512sums=("$_sha512sums")

package() {
  cd "$srcdir/OTF"

  install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-serif"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-serif/"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
