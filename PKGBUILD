# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-sans-classic-fonts
pkgver=2.004
pkgrel=2
pkgdesc='Adobe Source Han Sans fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-sans-classic"
license=('custom:OFL')
_sha512sums=$(curl -s -L https://github.com/redchenjs/source-han-sans-classic/releases/download/$pkgver/SourceHanSansC-OTF.zip.sha512sum)
source=($_sha512sums.zip::"https://github.com/redchenjs/source-han-sans-classic/releases/download/$pkgver/SourceHanSansC-OTF.zip")
sha512sums=("$_sha512sums")

package() {
  cd "$srcdir/OTF"

  install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-sans"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
