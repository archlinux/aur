# Maintainer: Erikas <erikmnkl@gmail.com>

pkgname=hunspell-lt
pkgver=1.3
pkgrel=2
pkgdesc="Lithuanian dictionary for Hunspell"
arch=('any')
license=('GPL2' 'LGPL2.1' 'MPL')
url="https://launchpad.net/ispell-lt"
optdepends=('hunspell: Hunspell spell checking library and program')
makedepends=('unzip')
source=("https://launchpad.net/ispell-lt/main/$pkgver/+download/myspell-lt-$pkgver.zip")
md5sums=('11320c87b4fd39726053fe7f6647a62c')

package() {
	install -d -m755 "$pkgdir/usr/share/hunspell"
	install -m644 "$srcdir/myspell-lt-$pkgver/lt_LT.dic" "$pkgdir/usr/share/hunspell/lt_LT.dic"
	install -m644 "$srcdir/myspell-lt-$pkgver/lt_LT.aff" "$pkgdir/usr/share/hunspell/lt_LT.aff"
	
	install -d -m755 "$pkgdir/usr/share/myspell/dicts"
	ln -s "/usr/share/hunspell/lt_LT.dic" "$pkgdir/usr/share/myspell/dicts/lt_LT.dic"
	ln -s "/usr/share/hunspell/lt_LT.aff" "$pkgdir/usr/share/myspell/dicts/lt_LT.aff"
}
