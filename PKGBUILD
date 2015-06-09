# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=pyScss
pkgname=python-${_pkgname,,}
pkgver=1.3.2
pkgrel=1
pkgdesc="A SCSS compiler for Python"
arch=("any")
license=("GPL")
url="https://pypi.python.org/pypi/pyScss"
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("196289e4e6e44505a097e1e7270e9c1bb918717256d5f4cf104f906ec789dfc7")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
