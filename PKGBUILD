# Maintainer: Winux <winux@winux.it>
pkgname=python-asyncer
_pkgname=asyncer
pkgver=0.0.7
pkgrel=1
pkgdesc="Asyncer, async and await, focused on developer experience."
arch=('any')
url="https://github.com/tiangolo/asyncer"
license=('MIT')
depends=('python' 'python-anyio' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pdm-backend')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('33443e769d11343197a436cc412fd4474053d58d7bdce591c0f56f3ef84a4eae')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
