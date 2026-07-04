# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-lark-oapi
pkgver=1.7.0
pkgrel=1
pkgdesc="Lark OpenAPI SDK for Python (Feishu)"
arch=('any')
url="https://github.com/larksuite/oapi-sdk-python"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python-requests' 'python-requests-toolbelt' 'python-pycryptodome' 'python-websockets' 'python-httpx')
source=("$pkgname-$pkgver.tar.gz::https://github.com/larksuite/oapi-sdk-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ca6b1cf63a8729cf345d52f03271391320cf59b2397ed1a812f50d264f243c55')

_srcdir="oapi-sdk-python-$pkgver"

build() {
    cd "$srcdir/$_srcdir"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_srcdir"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
