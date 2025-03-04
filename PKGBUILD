# Maintainer: Arturo Penen <apenen@gmail.com>

_name=grpcio_status
pkgname=python-grpcio-status
pkgver=1.70.0
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
sha256sums=('0e7b42816512433b18b9d764285ff029bde059e9d41f8fe10a60631bd8348101')

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

