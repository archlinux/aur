# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: mike2208

pkgname=python-ovs
_pkg="${pkgname#python-}"
pkgver=2.17.1.post1
pkgrel=1
pkgdesc='Open vSwitch Python library'
arch=('any')
url="https://github.com/openvswitch/ovs"
license=('Apache')
depends=('python-sortedcontainers')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('575c2d1aecf3599a77ea4c0634ca0a71a6089775c46d4b6ce04d69502428d9d8')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkg-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim:set ts=2 sw=2 et:
