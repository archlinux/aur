# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-google-cloud-testutils
_pkg=google_cloud_testutils
pkgver=1.8.0
pkgrel=1
pkgdesc="Collection of testing tools used in Python client libraries for Google APIs"
arch=('any')
url="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-testutils"
license=('Apache-2.0')
depends=('python-google-auth' 'python-click' 'python-packaging')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('aa56268146fff151b5c89d3538c631b1c2e8c6287a097e911d0610ff8163f6f3')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
