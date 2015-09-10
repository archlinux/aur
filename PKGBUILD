# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=bna
pkgname=python-$_pkgname
pkgver=4.0.1
pkgrel=1
pkgdesc="Command-line Battle.net authenticator and Python library"
arch=("any")
license=("MIT")
url="https://github.com/jleclanche/python-bna"
depends=("python")
source=(
	"https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
	"https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz.asc"
)
sha256sums=(
	"92404ac5856242a75df8dff69c0d122f6cb5c59cd7e545fba1a58e44fbd4831e"
	"SKIP"
)


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
