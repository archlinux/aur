# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Hübner <andhu@gmx.de>

pkgname=unicode
pkgver=1
pkgrel=2
pkgdesc='A simple command line utility that displays properties for a given unicode character'
url='https://github.com/garabik/unicode'
arch=('any')
license=('GPL3')
depends=('python')
source=("https://github.com/garabik/${pkgname}/archive/v${pkgver}.tar.gz"
        'http://www.unicode.org/Public/UNIDATA/UnicodeData.txt')
sha256sums=('127b3b26bd9f9dd9836811b18f1acd8717937c0acb81dd8276d1c8776c13e75f'
            '38b17e1118206489a7e0ab5d29d7932212d38838df7d3ec025ecb58e8798ec20')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 unicode "$pkgdir/usr/bin/unicode"
  install -Dm755 paracode "$pkgdir/usr/bin/paracode"

  install -Dm644 "unicode.$pkgver" "$pkgdir/usr/share/man/man1/unicode.$pkgver"
  install -Dm644 "paracode.$pkgver" "$pkgdir/usr/share/man/man1/paracode.$pkgver"

  install -Dm644 "$srcdir/UnicodeData.txt" "$pkgdir/usr/share/unicode/UnicodeData.txt"
}
