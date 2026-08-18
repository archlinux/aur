# Maintainer: Juan Martínez <mratmartinez at anche.no>
# Maintainer: XenGi <aur@xengi.de>

pkgname=python-q
pkgver=2.7
pkgrel=1
pkgdesc="Quick-and-dirty debugging output for tired (Python) programmers"
arch=("any")
url="https://pypi.python.org/pypi/q/"
license=("Apache-2.0")
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/q/q/q-$pkgver.tar.gz")
sha256sums=('8e0b792f6658ab9e1133b5ea17af1b530530e60124cf9743bc0fa051b8c64f4e')


package() {
	cd "$srcdir/q-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	# egg-info is not world-readable.
	chmod -R a+r "$pkgdir/usr/lib/"
}

