# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=pyScss
pkgname=python-${_pkgname,,}
pkgver=1.3.4
pkgrel=1
pkgdesc="A SCSS compiler for Python"
arch=("any")
license=("GPL")
url="https://pypi.python.org/pypi/pyScss"
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("d0323110ecc7d3ead6b99cfec31301306928130e4d0a9eb13226bf390aba8c0e")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
