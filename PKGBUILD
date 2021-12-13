# Maintainer: Xeonacid <h.dwwwwww at gmail dot com>

pkgname=python-cle
_pkgname="${pkgname#*-}"
pkgver=9.0.10730
pkgrel=1
pkgdesc="CLE Loads Everything (at least, many binary formats!) and provides a pythonic interface to analyze what they are and what they would look like in memory."
arch=('any')
url="https://github.com/angr/cle"
license=('BSD')
depends=('python-pyelftools' 'python-cffi' 'python-pyvex' 'python-pefile' 'python-sortedcontainers')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c948668bf72b7f366936a68c139a3021c67e938fb2b6cc7a088ecc2248987ba5')

build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
