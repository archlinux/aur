# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Hübner <andhu@gmx.de>

pkgname=unicode
pkgver=2.7
pkgrel=2
pkgdesc='Display unicode character properties on the command line'
url='https://github.com/garabik/unicode'
arch=('any')
license=('GPL3')
depends=('python')
source=("https://github.com/garabik/${pkgname}/archive/v${pkgver}.tar.gz"
        'http://www.unicode.org/Public/UNIDATA/UnicodeData.txt'
        'http://www.unicode.org/Public/UNIDATA/Blocks.txt')
sha256sums=('5e61318f0f9e3746f40f85fbe9113449b5ab5bbffc36586eb91a7ab16849ed1c'
            '57913fdb1c1271fa9fd51dea08d49370f33d5bfda6bbaba348f44d90029ea11d'
            'a1a3ca4381eb91f7b65afe7cb7df615cdcf67993fef4b486585f66b349993a10')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 unicode "$pkgdir/usr/bin/unicode"
  install -Dm755 paracode "$pkgdir/usr/bin/paracode"

  install -Dm644 "unicode.1" "$pkgdir/usr/share/man/man1/unicode.1"
  install -Dm644 "paracode.1" "$pkgdir/usr/share/man/man1/paracode.1"

  install -Dm644 "$srcdir/UnicodeData.txt" "$pkgdir/usr/share/unicode/UnicodeData.txt"
  install -Dm644 "$srcdir/Blocks.txt" "$pkgdir/usr/share/unicode/Blocks.txt"
}
