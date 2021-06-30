# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=python-remote-pdb
pkgver=2.1.0
pkgrel=1
pkgdesc="Remote vanilla PDB (over TCP sockets) done right: no extras, proper handling around connection failures and CI. Based on pdbx."
arch=(any)
url="https://github.com/ionelmc/python-remote-pdb"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("https://codeload.github.com/ionelmc/${pkgname}/zip/v${pkgver}")
md5sums=('59e123b9d8c2394c6a1feb7a0c794591')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
