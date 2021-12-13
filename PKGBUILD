# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-archinfo
_pkgname="${pkgname#*-}"
pkgver=9.0.10730
pkgrel=1
pkgdesc="A collection of classes that contain architecture-specific information."
arch=('any')
url="https://github.com/angr/archinfo"
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('7ae1d034ca69f355204ace2de889bad6604deb8012f5086e2427292d91da4699')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
