# Maintainer: Arturo Penen <apenen@gmail.com>

_name=cloudevents
pkgname=python-$_name
pkgver=1.12.0
pkgrel=1
pkgdesc="Package cloudevents provides primitives to work with CloudEvents specification."
url=https://github.com/cloudevents
arch=(any)
license=(Apache-2.0)
depends=(python python-deprecation python-pydantic)
makedepends=(python-setuptools python-wheel python-installer python-build)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ebd5544ceb58c8378a0787b657a2ae895e929b80a82d6675cba63f0e8c5539e0')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=2 sw=2 et:

