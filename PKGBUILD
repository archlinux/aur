# Maintainer: Mario Finelli <mario at finel dot li>

_name=google-cloud-compute
pkgname=python-$_name
pkgver=1.14.1
pkgrel=1
pkgdesc="Google Cloud Compute python SDK"
url=https://github.com/googleapis/python-compute
arch=(any)
license=(Apache)
depends=(python python-google-api-core python-proto-plus python-protobuf
         python-google-auth python-grpcio)
makedepends=(python-setuptools python-wheel python-installer python-build)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('acd987647d7c826aa97b4418141c740ead5e8811d3349315f2f89a30c01c7f4b')

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
