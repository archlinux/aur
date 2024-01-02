# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-validio-sdk
_name=validio_sdk
pkgver=0.12.0
pkgrel=1
pkgdesc="SDK for the Validio platform"
url="https://pypi.org/project/validio-sdk/"
depends=(
  'python-camel-converter'
  'python-httpx'
  'python-platformdirs'
  'python-pydantic')
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel')
license=('Apache-2.0')
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3c807f78828af4a7ccb8442e660c3ac8f4f01d5e66e39877d21f2ce29c7e4f2a')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
