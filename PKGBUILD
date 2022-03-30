# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=bna
pkgname=python-bna
pkgver=5.1.0
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
sha256sums=("f6c53527bc8fe35853f4962b67c8056d98b5adb6ba6cfd713506bc175bbb67a7")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
