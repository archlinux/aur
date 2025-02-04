# Maintainer: Arturo Penen <apenen@gmail.com>

_name=google_cloud_iam
pkgname=python-google-cloud-iam
pkgver=2.17.0
pkgrel=1
pkgdesc="Google Cloud IAM python SDK"
url=https://github.com/googleapis/google-cloud-python
arch=(any)
license=(Apache-2.0)
depends=(python python-google-api-core python-proto-plus python-protobuf
         python-google-auth python-grpcio)
makedepends=(python-setuptools python-wheel python-installer python-build)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4b7c4fa6593bd32618fe1dbdbde4cffe0d7f4e7c7851e94f5234d8a1ba2f1ebf')

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

