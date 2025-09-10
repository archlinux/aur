# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Hübner <andhu@gmx.de>

pkgname=unicode
pkgver=3.2
_commit=fa4fa6118d68c693ee14b97df6bf12d2fdbb37df
pkgrel=1
pkgdesc='Display unicode character properties on the command line'
url='https://github.com/garabik/unicode'
arch=('any')
license=('GPL-3.0-only')
depends=('python')
source=("git+https://github.com/garabik/${pkgname%-git}.git#commit=$_commit"
        UnicodeData-${pkgver}-${pkgrel}.txt::'https://www.unicode.org/Public/UNIDATA/UnicodeData.txt'
        Blocks-${pkgver}-${pkgrel}.txt::'https://www.unicode.org/Public/UNIDATA/Blocks.txt')
sha256sums=('2997e87f7f45de9750d027de9d9d94c5343eab6e0e4051c5fc6f53ca84f932f9'
            '2e1efc1dcb59c575eedf5ccae60f95229f706ee6d031835247d843c11d96470c'
            'c0edefaf1a19771e830a82735472716af6bf3c3975f6c2a23ffbe2580fbbcb15')

package() {
  cd "$pkgname"

  install -Dm755 unicode "$pkgdir/usr/bin/unicode"
  install -Dm755 paracode "$pkgdir/usr/bin/paracode"

  install -Dm644 "unicode.1" "$pkgdir/usr/share/man/man1/unicode.1"
  install -Dm644 "paracode.1" "$pkgdir/usr/share/man/man1/paracode.1"

  install -Dm644 "$srcdir/UnicodeData-${pkgver}-${pkgrel}.txt" "$pkgdir/usr/share/unicode/UnicodeData.txt"
  install -Dm644 "$srcdir/Blocks-${pkgver}-${pkgrel}.txt" "$pkgdir/usr/share/unicode/Blocks.txt"
}
