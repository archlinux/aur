
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

_lang=ita-eng
_pkgname=dict-freedict-$_lang
pkgname=$_pkgname-bin
pkgver=0.2
pkgrel=1
pkgdesc='Italian -> English dictionary for dictd.'
arch=('any')
url='https://freedict.org'
license=('GPL')
optdepends=('dictd: dict client and server')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://download.freedict.org/dictionaries/$_lang/$pkgver/freedict-$_lang-$pkgver.dictd.tar.xz")
sha512sums=('c5de67768f2e3ea9dd98c8d4acdad6d30d9b36776e8f4ffc6a92bd215a88f014f0d7964ff27e553fed19926f874b3338595592555253f6870813cb58259fe243')

package() {
	cd $_lang

	install -Dvm 644 $_lang.{dict.dz,index} -t "$pkgdir/usr/share/dictd"
	install -Dvm 644 README -t "$pkgdir/usr/share/doc/freedict/$_lang"
	install -Dvm 644 COPYING -t "$pkgdir/usr/share/licenses/freedict/$_lang"
}
