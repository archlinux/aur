# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Hübner <andhu@gmx.de>

pkgname=unicode
pkgver=1
pkgrel=1
pkgdesc='A command line unicode database query tool'
url='http://kassiopeia.juls.savba.sk/~garabik/software/unicode/'
arch=('any')
license=('GPL3')
depends=('python2>=2.3')
source=("http://kassiopeia.juls.savba.sk/~garabik/software/unicode/${pkgname}_${pkgver}.tar.gz"
        'http://www.unicode.org/Public/UNIDATA/UnicodeData.txt')
sha256sums=('d354eaba78f31f419ead9493ca97b8664264ce5975e9836fe7abab5371921b5e'
            '38b17e1118206489a7e0ab5d29d7932212d38838df7d3ec025ecb58e8798ec20')

prepare() {
  cd "$pkgname"

  sed -i '1s/python$/python2/' unicode
  sed -i '1s/python$/python2/' paracode
}

package() {
  cd "$pkgname"

  install -Dm755 unicode "$pkgdir/usr/bin/unicode"
  install -Dm755 paracode "$pkgdir/usr/bin/paracode"

  install -Dm644 "unicode.$pkgver" "$pkgdir/usr/share/man/man1/unicode.$pkgver"
  install -Dm644 "paracode.$pkgver" "$pkgdir/usr/share/man/man1/paracode.$pkgver"

  install -Dm644 "$srcdir/UnicodeData.txt" "$pkgdir/usr/share/unicode/UnicodeData.txt"
}
