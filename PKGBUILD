# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

_name=proto-plus
pkgname=python-$_name
pkgver=1.28.2
pkgrel=1
pkgdesc="A wrapper around protocol buffers"
arch=(any)
url=https://github.com/googleapis/google-cloud-python
license=(Apache-2.0)
depends=(python python-protobuf)
makedepends=(python-build python-installer python-setuptools python-wheel)
# TODO switch to the source package on pypi because this now downloads 100M+
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${_name}-v${pkgver}.tar.gz")
sha256sums=('69d6ef649759379f4214185e69516ba2c3af3cf399341aa62f5689ea925618a5')

build() {
  cd google-cloud-python-${_name}-v${pkgver}/packages/${_name}
  python -m build --wheel --no-isolation
}

package() {
  cd google-cloud-python-${_name}-v${pkgver}/packages/${_name}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=2 sw=2 et:
