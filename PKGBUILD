# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-validio-sdk
_name=validio_sdk
pkgver=0.14.0
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
sha256sums=('f0ef449ee6acaf52fe3e9fb7d41940d6c8bd80e523b655cff481640e4b1bfb41')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
