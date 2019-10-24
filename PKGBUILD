# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=bna
pkgname=python-bna
pkgver=5.0.0
pkgrel=2
pkgdesc="Command-line Battle.net authenticator and Python library"
arch=("any")
license=("MIT")
url="https://github.com/jleclanche/python-bna"
depends=("python-click" "python-pyotp")
source=(
	"https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
#	"https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz.asc"
)
sha256sums=("63adfa2e2ac83f0b350a5413e48c97b662ef21e3edb36e87b2aa14369cd8b074")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
