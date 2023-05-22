# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tully Foote <tfoote@osrfoundation.org>

pkgname=python-rocker
_pkg="${pkgname#python-}"
pkgver=0.2.12
pkgrel=1
pkgdesc='A tool to run Docker containers with customized extras'
arch=('any')
url=https://github.com/osrf/rocker
license=('Apache')
depends=('python-docker' 'python-empy' 'python-packaging' 'python-pexpect' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/r/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('c34797cd5394808a3709db7c489e1e7cd199935538d9a48ece1721db83e4dedf')

build() {
    cd "$_pkg-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkg-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
}
