# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-mono-classic-fonts
pkgver=1.002
pkgrel=8
pkgdesc='Adobe Source Han Mono fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-mono-classic"
license=('custom:OFL')
_sha512sums=$(curl -s -L https://github.com/redchenjs/source-han-mono-classic/releases/download/$pkgver/SourceHanMonoC-OTF.zip.sha512sum)
source=($_sha512sums.zip::"https://github.com/redchenjs/source-han-mono-classic/releases/download/$pkgver/SourceHanMonoC-OTF.zip")
sha512sums=("$_sha512sums")

package() {
  cd "$srcdir/OTF"

  install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-sans"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
