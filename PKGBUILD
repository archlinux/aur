# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Hübner <andhu@gmx.de>

pkgname=unicode
pkgver=2.9
pkgrel=2
pkgdesc='Display unicode character properties on the command line'
url='https://github.com/garabik/unicode'
arch=('any')
license=('GPL3')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/garabik/${pkgname}/archive/v${pkgver}.tar.gz"
        UnicodeData-${pkgver}-${pkgrel}.txt::'https://www.unicode.org/Public/UNIDATA/UnicodeData.txt'
        Blocks-${pkgver}-${pkgrel}.txt::'https://www.unicode.org/Public/UNIDATA/Blocks.txt')
sha256sums=('87df5fa2c346928984e4e3767d194a0332bdb5526eb8f8665075db9a76f50ce4'
            '806e9aed65037197f1ec85e12be6e8cd870fc5608b4de0fffd990f689f376a73'
            '529dc5d0f6386d52f2f56e004bbfab48ce2d587eea9d38ba546c4052491bd820')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 unicode "$pkgdir/usr/bin/unicode"
  install -Dm755 paracode "$pkgdir/usr/bin/paracode"

  install -Dm644 "unicode.1" "$pkgdir/usr/share/man/man1/unicode.1"
  install -Dm644 "paracode.1" "$pkgdir/usr/share/man/man1/paracode.1"

  install -Dm644 "$srcdir/UnicodeData-${pkgver}-${pkgrel}.txt" "$pkgdir/usr/share/unicode/UnicodeData.txt"
  install -Dm644 "$srcdir/Blocks-${pkgver}-${pkgrel}.txt" "$pkgdir/usr/share/unicode/Blocks.txt"
}
