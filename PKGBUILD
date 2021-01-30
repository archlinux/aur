# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=bna
pkgname=python-bna
pkgver=5.0.1
pkgrel=1
pkgdesc="Command-line Battle.net authenticator and Python library"
arch=("any")
license=("MIT")
url="https://github.com/jleclanche/python-bna"
depends=("python-click" "python-pyotp")
source=(
	"https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
#	"https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz.asc"
)
sha256sums=("660080f8a722b2513c36dc707c09cd7de934c59c583ab0cf73b51f8ff82ec451")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
