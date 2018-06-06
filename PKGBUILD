# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Hübner <andhu@gmx.de>

pkgname=unicode
pkgver=2.6
pkgrel=2
pkgdesc='Display unicode character properties on the command line'
url='https://github.com/garabik/unicode'
arch=('any')
license=('GPL3')
depends=('python')
source=("https://github.com/garabik/${pkgname}/archive/v${pkgver}.tar.gz"
        'http://www.unicode.org/Public/UNIDATA/UnicodeData.txt'
        'http://www.unicode.org/Public/UNIDATA/Blocks.txt')
sha256sums=('6bf64ff6f8c47eaab83f1b130bbcd1d91fdecd9de5c026bf3611adcc615616f9'
            '4997a3196eb79b4d0d6b8384560f6aeb46a062693f0abd5ba736abbff7976099'
            '0b457b66c788a97c8521e265f0b793d4ed911356d39eb61029f9cef8554cd052')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 unicode "$pkgdir/usr/bin/unicode"
  install -Dm755 paracode "$pkgdir/usr/bin/paracode"

  install -Dm644 "unicode.1" "$pkgdir/usr/share/man/man1/unicode.1"
  install -Dm644 "paracode.1" "$pkgdir/usr/share/man/man1/paracode.1"

  install -Dm644 "$srcdir/UnicodeData.txt" "$pkgdir/usr/share/unicode/UnicodeData.txt"
  install -Dm644 "$srcdir/Blocks.txt" "$pkgdir/usr/share/unicode/Blocks.txt"
}
