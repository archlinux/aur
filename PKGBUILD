# Maintainer: Marcus Johansson <polarn@gmail.com>

pkgname=python-validio-sdk
_name=validio_sdk
pkgver=6.0.1
pkgrel=1
pkgdesc="SDK for the Validio platform"
url="https://pypi.org/project/validio-sdk/"
depends=(
  'python-aiohttp'
  'python-annotated-types'
  'python-anyio'
  'python-camel-converter'
  'python-gql'
  'python-h11'
  'python-httpcore'
  'python-httpx'
  'python-pydantic-core'
  'python-pydantic'
  'python-sniffio'
  'python-typing-inspection'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel')
license=('Apache-2.0')
arch=(any)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('21f663cb28fbff1742790dc78204867432e017da5b0b0717697d31273c4547f9')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
