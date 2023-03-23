# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-irc3-plugins-test
_pkg="${pkgname#python-}"
pkgver=0.0.3
pkgrel=1
pkgdesc='Test plugin for IRC3'
arch=('any')
url="https://github.com/gtmanfred/irc3-plugins-test"
license=('unknown')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('092ab4c12d874cda3856b44ab7b66ee12f75c41df545464f259b1a65ec700beb')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
