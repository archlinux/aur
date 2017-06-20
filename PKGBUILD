# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Hübner <andhu@gmx.de>

pkgname=unicode
pkgver=2.4
pkgrel=2
pkgdesc='Display unicode character properties on the command line'
url='https://github.com/garabik/unicode'
arch=('any')
license=('GPL3')
depends=('python')
source=("https://github.com/garabik/${pkgname}/archive/v${pkgver}.tar.gz"
        'http://www.unicode.org/Public/UNIDATA/UnicodeData.txt'
        'http://www.unicode.org/Public/UNIDATA/Blocks.txt')
sha256sums=('0e3dbf8ae9b136e1799d3ed59628d2908cd89cf4ee8f3a8277d5cffc6e12e8e4'
            '52423e4d7492167b62f518f68d54db88930abbbff7f11edfcaec8f726498cab1'
            '5ae1649a42ed8ae8cb885af79563f00a9ae17e602405a56ed8aca214da14eea7')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 unicode "$pkgdir/usr/bin/unicode"
  install -Dm755 paracode "$pkgdir/usr/bin/paracode"

  install -Dm644 "unicode.1" "$pkgdir/usr/share/man/man1/unicode.1"
  install -Dm644 "paracode.1" "$pkgdir/usr/share/man/man1/paracode.1"

  install -Dm644 "$srcdir/UnicodeData.txt" "$pkgdir/usr/share/unicode/UnicodeData.txt"
  install -Dm644 "$srcdir/Blocks.txt" "$pkgdir/usr/share/unicode/Blocks.txt"
}
