# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-pocketbase
pkgver=0.17.3
pkgrel=1
pkgdesc="PocketBase Python SDK"
arch=('any')
url="https://github.com/vaphes/pocketbase"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build' )
depends=('python-httpx' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pocketbase/pocketbase-0.17.3.tar.gz")
sha256sums=('11de4d412fddc98e72030fa78b395972eaa646c36c06aa2506d8a26cd251cb00')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
