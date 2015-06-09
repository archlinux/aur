# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=unicards
pkgname=python-$_pkgname
pkgver=0.6
pkgrel=1
pkgdesc="A Python module for converting strings into unicode playing cards"
arch=("any")
url="https://github.com/lmacken/unicards"
license=("APACHE")
depends=("python")
source=("http://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("b06f6effd7782f9541e5761afc4ee01ee7e163f9c6c04ad9b3712354f0a2cfdd")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
