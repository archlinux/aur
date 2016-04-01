# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=protobuf
pkgname=python-$_pkgname
pkgver=3.0.0b2.post2
pkgrel=1
pkgdesc="Python 3 bindings to Google Protocol Buffers"
arch=("any")
license=("BSD")
url="https://github.com/google/protobuf"
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("37127b74dd673f3815e24f8c1c62df25879da508e22537d5603603658f99b229")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python ./setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python ./setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
