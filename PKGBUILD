# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-google-cloud-testutils
_pkg=google_cloud_testutils
pkgver=1.9.2
pkgrel=1
pkgdesc="Collection of testing tools used in Python client libraries for Google APIs"
arch=('any')
url="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-testutils"
license=('Apache-2.0')
depends=('python-google-auth' 'python-click' 'python-packaging')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('664bd32b850726be2ed52f3f75418d1dcdf9b0c4f620fbebb3f4109f9e1ebd7b')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
