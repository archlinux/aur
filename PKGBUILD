# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=q
pkgname=python2-$_pkgname
pkgver=2.6
pkgrel=2
pkgdesc="Quick-and-dirty debugging output for tired programmers"
arch=("any")
license=("APACHE")
url="https://github.com/zestyping/q"
depends=("python")
source=("http://pypi.python.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=("de0fcf5a439754975dd8022c3bf26374b882d0fe4265aab8813f4e87e057eed5")


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
