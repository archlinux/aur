
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

_lang=eng-ita
_pkgname=dict-freedict-$_lang
pkgname=$_pkgname-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='English -> Italian dictionary for dictd.'
arch=('any')
url='https://freedict.org'
license=('GPL')
optdepends=('dictd: dict client and server')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://download.freedict.org/dictionaries/$_lang/$pkgver/freedict-$_lang-$pkgver.dictd.tar.xz")
sha512sums=('69a5a77ab7031a4a3833b7106c12ad2dd348c0bd51bbc2ed9b8276e1215e7679dcc55c013a6fffa28332fb64514b0d54586c29aa686b8491965e3c0e0184b048')

package() {
	cd $_lang

	install -Dvm 644 $_lang.{dict.dz,index} -t "$pkgdir/usr/share/dictd"
	install -Dvm 644 README -t "$pkgdir/usr/share/doc/freedict/$_lang"
	install -Dvm 644 COPYING -t "$pkgdir/usr/share/licenses/freedict/$_lang"
}
