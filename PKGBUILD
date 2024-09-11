# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Hübner <andhu@gmx.de>

pkgname=unicode
pkgver=2.9
pkgrel=4
pkgdesc='Display unicode character properties on the command line'
url='https://github.com/garabik/unicode'
arch=('any')
license=('GPL3')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/garabik/${pkgname}/archive/v${pkgver}.tar.gz"
        UnicodeData-${pkgver}-${pkgrel}.txt::'https://www.unicode.org/Public/UNIDATA/UnicodeData.txt'
        Blocks-${pkgver}-${pkgrel}.txt::'https://www.unicode.org/Public/UNIDATA/Blocks.txt')
sha256sums=('87df5fa2c346928984e4e3767d194a0332bdb5526eb8f8665075db9a76f50ce4'
            'ff58e5823bd095166564a006e47d111130813dcf8bf234ef79fa51a870edb48f'
            'f3907b395d410f1b97342292ca6bc83dd12eb4b205f2a0c48efdef99e517d7b0')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 unicode "$pkgdir/usr/bin/unicode"
  install -Dm755 paracode "$pkgdir/usr/bin/paracode"

  install -Dm644 "unicode.1" "$pkgdir/usr/share/man/man1/unicode.1"
  install -Dm644 "paracode.1" "$pkgdir/usr/share/man/man1/paracode.1"

  install -Dm644 "$srcdir/UnicodeData-${pkgver}-${pkgrel}.txt" "$pkgdir/usr/share/unicode/UnicodeData.txt"
  install -Dm644 "$srcdir/Blocks-${pkgver}-${pkgrel}.txt" "$pkgdir/usr/share/unicode/Blocks.txt"
}
