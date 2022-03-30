# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-claripy
_pkgname="${pkgname#*-}"
pkgver=9.1.12332
pkgrel=1
pkgdesc="An abstraction layer for constraint solvers"
arch=('any')
url="https://github.com/angr/claripy"
license=('BSD')
depends=('python-z3' 'python-future' 'python-cachetools' 'python-decorator' 'python-pysmt')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('1d7afd89b46c0f8283a35dd4e33434fe3595dc8263f924c95d2c9b2b2eb4fe4b')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
