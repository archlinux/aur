# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tully Foote <tfoote@osrfoundation.org>

pkgname=python-rocker
pkgver=0.2.9
pkgrel=1
pkgdesc='A tool to run docker containers with customized extras'
arch=('any')
url=https://github.com/osrf/rocker
license=('Apache')
depends=('python-docker' 'python-empy' 'python-packaging' 'python-pexpect')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/r/rocker/rocker-$pkgver.tar.gz")
sha256sums=('1895c3d678ab09aae5de655f0ea510e34c1442df61508232b45d2522ed89270c')

build() {
	cd "rocker-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "rocker-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
