# Maintainer: Mario Finelli <mario at finel dot li>

_name=google-cloud-compute
pkgname=python-$_name
pkgver=1.11.0
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
sha256sums=('d1d05a4b3ec6f830bbdcc779a740e963a80d324a4fd6ef41a7c248a07cf96489')

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
