# Maintainer: Arturo Penen <apenen@gmail.com>

_name=grpcio_status
pkgname=python-grpcio-status
pkgver=1.66.1
pkgrel=1
pkgdesc="Status proto mapping for gRPC"
url=https://grpc.io
arch=(any)
license=(Apache-2.0)
depends=(python python-google-api-core python-proto-plus python-protobuf
         python-google-auth python-grpcio)
makedepends=(python-setuptools python-wheel python-installer python-build)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b3f7d34ccc46d83fea5261eea3786174459f763c31f6e34f1d24eba6d515d024')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ts=2 sw=2 et:

