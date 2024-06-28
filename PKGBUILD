# Maintainer: Arturo Penen <apenen@gmail.com>

_name=cloudevents
pkgname=python-$_name
pkgver=1.11.0
pkgrel=1
pkgdesc="Package cloudevents provides primitives to work with CloudEvents specification."
url=https://github.com/cloudevents
arch=(any)
license=(Apache-2.0)
depends=(python python-deprecation python-pydantic)
makedepends=(python-setuptools python-wheel python-installer python-build)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5be990583e99f3b08af5a709460e20b25cb169270227957a20b47a6ec8635e66')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=2 sw=2 et:

