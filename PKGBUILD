# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-lark-oapi
pkgver=1.7.1
pkgrel=1
pkgdesc="Lark OpenAPI SDK for Python (Feishu)"
arch=('any')
url="https://github.com/larksuite/oapi-sdk-python"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python-requests' 'python-requests-toolbelt' 'python-pycryptodome' 'python-websockets' 'python-httpx')
source=("$pkgname-$pkgver.tar.gz::https://github.com/larksuite/oapi-sdk-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9baeb7225f213f027433cb826b3f0e91d2f9a8aa1cfe1359699fb29f90e8c14b')

_srcdir="oapi-sdk-python-$pkgver"

build() {
    cd "$srcdir/$_srcdir"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_srcdir"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
