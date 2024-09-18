# Maintainer: Arturo Penen <apenen@gmail.com>

_name=google_cloud_pubsub
pkgname=python-google-cloud-pubsub
pkgver=2.23.1
pkgrel=1
pkgdesc="Google Cloud PubSub python SDK"
url=https://github.com/googleapis/google-cloud-python
arch=(any)
license=(Apache-2.0)
depends=(python python-google-api-core python-proto-plus python-protobuf
         python-google-auth python-grpcio)
makedepends=(python-setuptools python-wheel python-installer python-build)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e1fde79b5b64b721290af4c022907afcbb83512d92f4e5c334c391cfbb022acb')

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

