# Maintainer: Juan Martínez <mratmartinez at anche.no>

pkgname=python-q
pkgver=2.6
pkgrel=2
pkgdesc="Quick-and-dirty debugging output for tired (Python) programmers"
arch=("any")
url="https://pypi.python.org/pypi/q/"
license=("Apache")
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/q/q/q-$pkgver.tar.gz")
sha256sums=("de0fcf5a439754975dd8022c3bf26374b882d0fe4265aab8813f4e87e057eed5")


package() {
	cd "$srcdir/q-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	# egg-info is not world-readable.
	chmod -R a+r "$pkgdir/usr/lib/"
}

