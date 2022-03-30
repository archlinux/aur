# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-archinfo
_pkgname="${pkgname#*-}"
pkgver=9.1.12332
pkgrel=1
pkgdesc="A collection of classes that contain architecture-specific information."
arch=('any')
url="https://github.com/angr/archinfo"
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ea3e45a96ab15d29225f9bd6c254738f9f00d5c2aa8293cf9db7aff98c355060')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
