# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tully Foote <tfoote@osrfoundation.org>

pkgname=python-rocker
_pkg="${pkgname#python-}"
pkgver=0.2.10
pkgrel=1
pkgdesc='A tool to run Docker containers with customized extras'
arch=('any')
url=https://github.com/osrf/rocker
license=('Apache')
depends=('python-docker' 'python-empy' 'python-packaging' 'python-pexpect' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/r/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('b61b44c514b78de6dc9c3056d8eb6c8dda64134ff436e0461354a88ecdd413de')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
