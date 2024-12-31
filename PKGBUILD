# Contributor: piernov <piernov@piernov.org>

pkgname=python-neptune-client
pkgver=1.14.0rc0
pkgrel=1
pkgdesc="Neptune Client"
arch=('x86_64')
url="https://github.com/neptune-ai/neptune-client"
license=('APACHE')
depends=('python-bravado' 'python-click' 'python-oauthlib' 'python-pandas' 'python-pyjwt' 'python-requests' 'python-requests-oauthlib' 'python-websocket-client' 'python-urllib3' 'python-psutil')
makedepends=('python-build' 'python-installer' 'python-poetry-dynamic-versioning')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neptune-ai/neptune-client/archive/refs/tags/$pkgver.tar.gz")
md5sums=('76e6f38756b5fccf230a43f2eff4104b')

build() {
  cd "$srcdir"/neptune-client-$pkgver
  export POETRY_DYNAMIC_VERSIONING_BYPASS=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/neptune-client-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
