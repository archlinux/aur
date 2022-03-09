# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: redfish <redfish@galactica.pw>

pkgname=python-coincurve
pkgver=17.0.0
pkgrel=1
pkgdesc='Cross-platform Python CFFI bindings for libsecp256k1'
arch=('x86_64')
url="https://github.com/ofek/coincurve"
license=('GPL')
depends=('python-cffi' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/coincurve/coincurve-$pkgver.tar.gz")
sha256sums=('68da55aff898702952fda3ee04fd6ed60bb6b91f919c69270786ed766b548b93')

build() {
	cd "coincurve-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "coincurve-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
