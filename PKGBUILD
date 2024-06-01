# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-validio-sdk
_name=validio_sdk
pkgver=0.18.1
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
sha256sums=('0223eac072cedc992ac004cc268661d3feecf23e8edf4050c864ff11d638f340')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
