# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-some-flask-helpers
pkgver=0.2.2
pkgrel=1
pkgdesc="Generic tools for Flask applications"
arch=('any')
url="https://github.com/marcus67/some_flask_helpers"
license=('GPL3')
depends=('python-flask' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/some-flask-helpers/some-flask-helpers-$pkgver.tar.gz")
sha256sums=('303631b4108756711fdeaa4a008ed91082fd221c0ef7f56cc72c4d4a693943b6')

build() {
	cd "some-flask-helpers-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "some-flask-helpers-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
