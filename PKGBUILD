# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=bna
pkgname=python-$_pkgname
pkgver=4.1.0
pkgrel=1
pkgdesc="Command-line Battle.net authenticator and Python library"
arch=("any")
license=("MIT")
url="https://github.com/jleclanche/python-bna"
depends=("python")
source=(
	"https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
#	"https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz.asc"
)
sha256sums=(
	"922047f6b00dc88ce55d4be4d7bd1a56a6496ede4fa91b439bef14c938d8c9b2"
#	"SKIP"
)


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
