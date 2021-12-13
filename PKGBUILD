# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-claripy
_pkgname="${pkgname#*-}"
pkgver=9.0.10730
pkgrel=1
pkgdesc="An abstraction layer for constraint solvers"
arch=('any')
url="https://github.com/angr/claripy"
license=('BSD')
depends=('python-z3' 'python-future' 'python-cachetools' 'python-decorator' 'python-pysmt')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ed40659e3c1fbf523da05758307034e14d63cb1e708011169283d8e509197b7c')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
