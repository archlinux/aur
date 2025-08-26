# Contributor: piernov <piernov@piernov.org>

pkgname=python-neptune-client
pkgver=1.14.0
pkgrel=1
pkgdesc="The experiment tracker for foundation model training"
arch=('x86_64')
url="https://github.com/neptune-ai/neptune-client"
license=('APACHE')
depends=(
'python'
'python-bravado'
'python-bravado-core'
'python-click'
'python-oauthlib'
'python-packaging'
'python-pandas'
'python-protobuf'
'python-psutil'
'python-pyjwt'
'python-requests'
'python-requests-oauthlib'
'python-setuptools'
'python-simplejson'
'python-typing_extensions'
'python-urllib3'
'python-websocket-client'
)
makedepends=('python-build' 'python-installer' 'python-poetry-dynamic-versioning')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neptune-ai/neptune-client/archive/refs/tags/$pkgver.tar.gz")
md5sums=('d221d1ff0795d7a028ff97ac6b8b63bb')

build() {
  cd "$srcdir"/neptune-client-$pkgver
  export POETRY_DYNAMIC_VERSIONING_BYPASS=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/neptune-client-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
