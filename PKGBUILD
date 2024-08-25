# Maintainer: Winux <winux@winux.it>
pkgname=python-asyncer
_pkgname=asyncer
pkgver=0.0.8
pkgrel=1
pkgdesc="Asyncer, async and await, focused on developer experience."
arch=('any')
url="https://github.com/tiangolo/asyncer"
license=('MIT')
depends=('python' 'python-anyio' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('476b978a144f83c99645897873978d636c47f2c09ac2b3d475e45f6694246753')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
