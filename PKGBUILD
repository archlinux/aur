pkgname=python-trianglesolver
pkgdesc="Find all the sides and angles of a triangle"
pkgver=1.2
pkgrel=1
arch=('any')
url="https://github.com/sbyrnes321/trianglesolver"
license=('MIT')
depends=()
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/t/trianglesolver/trianglesolver-$pkgver.tar.gz")
sha256sums=('4af18aade579d5c0d64389b3e65aeaf06cff26319762ccd859e3268559a76aea')

build() {
  cd trianglesolver-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd trianglesolver-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
