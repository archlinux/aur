# Maintainer: Arturo Penen <apenen@gmail.com>

_name=grpc_google_iam_v1
pkgname=python-grpc-google-iam-v1
pkgver=0.14.1
pkgrel=1
pkgdesc="gRPC Google IAM python"
url=https://github.com/googleapis/google-cloud-python
arch=(any)
license=(Apache-2.0)
depends=(python python-google-api-core python-proto-plus python-protobuf
         python-google-auth python-grpcio)
makedepends=(python-setuptools python-wheel python-installer python-build)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('14149f37af0e5779fa8a22a8ae588663269e8a479d9c2e69a5056e589bf8a891')

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

