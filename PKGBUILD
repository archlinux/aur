# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=q
pkgname=python2-$_pkgname
pkgver=2.5
pkgrel=1
pkgdesc="Quick-and-dirty debugging output for tired programmers"
arch=("any")
license=("APACHE")
url="https://github.com/zestyping/q"
depends=("python")
source=("http://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("d115f95058f18250faec0b7fe8a86a926939e5df215dcdbf8729906d9a34b657")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
