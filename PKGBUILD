# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=protobuf
pkgname=python-$_pkgname
pkgver=3.0.0a3
pkgrel=2
pkgdesc="Python 3 bindings to Google Protocol Buffers"
arch=("any")
license=("BSD")
url="https://github.com/google/protobuf"
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("b61622de5048415bfd3f2d812ad64606438ac9e25009ae84191405fe58e522c1")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python ./setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python ./setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
