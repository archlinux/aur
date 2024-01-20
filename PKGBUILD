# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: Erikas <erikmnkl@gmail.com>

pkgname=hunspell-lt
pkgver=1.3.2
pkgrel=2
pkgdesc="Lithuanian dictionary for Hunspell"
arch=('any')
license=('BSD-3-Clause')
url="https://github.com/ispell-lt/ispell-lt"
optdepends=('hunspell: Hunspell spell checking library and program')
makedepends=('unzip')
source=("$url/releases/download/rel-$pkgver/myspell-lt-$pkgver.zip")
sha256sums=('c1b4b5604143b480bf7890470db7f5e38c668053ee4d5b84383fa8c987921f82')

package() {
	cd "${srcdir}/myspell-lt-${pkgver}"

	install -Dm644 lt_LT.dic lt_LT.aff -t "${pkgdir}/usr/share/hunspell"
	
	install -dm755 "$pkgdir/usr/share/myspell/dicts"
	ln -s "/usr/share/hunspell/lt_LT.dic" "$pkgdir/usr/share/myspell/dicts/lt_LT.dic"
	ln -s "/usr/share/hunspell/lt_LT.aff" "$pkgdir/usr/share/myspell/dicts/lt_LT.aff"

	# BSD-3-clause license
	install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
