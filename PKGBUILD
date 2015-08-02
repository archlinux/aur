# Contributor: Andreas Hübner <andhu@gmx.de>
pkgname=unicode
pkgver=0.9.8
pkgrel=1
pkgdesc="A command line unicode database query tool"
url="http://kassiopeia.juls.savba.sk/~garabik/software/unicode/"
arch=('any')
license=('GPL3')
depends=('python2>=2.3')
backup=()
options=()
changelog=ChangeLog
source=(http://kassiopeia.juls.savba.sk/~garabik/software/unicode/${pkgname}_${pkgver}.tar.gz
        http://www.unicode.org/Public/UNIDATA/UnicodeData.txt)
md5sums=('a6dde358a64c941d7223fd44561d52cc'
         'c8355655731d75e6a3de8c20d7e601ba')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i '1s/python$/python2/' unicode
  sed -i '1s/python$/python2/' paracode

  install -Dm755 unicode $pkgdir/usr/bin/unicode
  install -Dm755 paracode $pkgdir/usr/bin/paracode

  install -Dm644 unicode.1 $pkgdir/usr/share/man/man1/unicode.1
  install -Dm644 paracode.1 $pkgdir/usr/share/man/man1/paracode.1

  install -Dm644 $srcdir/UnicodeData.txt $pkgdir/usr/share/unicode/UnicodeData.txt
}

# vim:set ts=2 sw=2 et:
