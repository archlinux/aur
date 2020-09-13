# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=pyScss
pkgname=python-pyscss
pkgver=1.3.7
pkgrel=1
pkgdesc="A SCSS compiler for Python"
arch=("any")
license=("GPL")
url="https://github.com/Kronuz/pyScss"
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("f1df571569021a23941a538eb154405dde80bed35dc1ea7c5f3e18e0144746bf")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
