# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=tesserwrap
pkgname=python-$_pkgname
pkgver=0.1.6
pkgrel=1
pkgdesc="Basic python bindings to the Tesseract C++ API"
arch=("any")
license=("APACHE")
url="https://pypi.python.org/pypi/tesserwrap"
depends=("python" "tesseract")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("a26fc24d6de144b6a99d7802973e2a191a69dd6a532f6a20c580670aba9f49e0")

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
