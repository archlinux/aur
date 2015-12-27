# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=polib
pkgname=python-$_pkgname
pkgver=1.0.7
pkgrel=1
pkgdesc="A library to manipulate, create and modify gettext files"
url="https://bitbucket.org/izi/polib/"
arch=("any")
license=("MIT")
depends=("python")
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("43ce60d05ffa442ba9d3c5722193aadb93c38174b9fb471c8ea7ccbf8349bbca")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
