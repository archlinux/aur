# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Hübner <andhu@gmx.de>

pkgname=unicode
pkgver=2.2
pkgrel=2
pkgdesc='Display unicode character properties on the command line'
url='https://github.com/garabik/unicode'
arch=('any')
license=('GPL3')
depends=('python')
source=("https://github.com/garabik/${pkgname}/archive/v${pkgver}.tar.gz"
        'http://www.unicode.org/Public/UNIDATA/UnicodeData.txt'
        'http://www.unicode.org/Public/UNIDATA/Blocks.txt')
sha256sums=('bc2e61cdb49d7acc1146553d77038ca22bc74b20e24a1d471c7c5949f106a8a9'
            '38b17e1118206489a7e0ab5d29d7932212d38838df7d3ec025ecb58e8798ec20'
            '288fc7b85c76bda296e296c8465f1f4baeb456cb814430dfaa0f546bfbe86b4a')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 unicode "$pkgdir/usr/bin/unicode"
  install -Dm755 paracode "$pkgdir/usr/bin/paracode"

  install -Dm644 "unicode.1" "$pkgdir/usr/share/man/man1/unicode.1"
  install -Dm644 "paracode.1" "$pkgdir/usr/share/man/man1/paracode.1"

  install -Dm644 "$srcdir/UnicodeData.txt" "$pkgdir/usr/share/unicode/UnicodeData.txt"
  install -Dm644 "$srcdir/Blocks.txt" "$pkgdir/usr/share/unicode/Blocks.txt"
}
