pkgname=python-normcst
pkgver=0.2.0
pkgrel=1
pkgdesc='Tools for LibCST related to normalization'
arch=('any')
url='https://gitlab.com/notEvil/normcst'
license=('MIT')
source=(
  "https://pypi.io/packages/source/n/normcst/normcst-$pkgver.tar.gz"
)
sha256sums=(
  '36e8ea117709d77e794dabac0da7604d491b90515e60da902eeac854de1e86f6'
)
depends=('python' 'python-libcst')
optdepends=('python-black: for normcst.black')
makedepends=('python-build' 'python-installer' 'python-wheel')

build() {
  cd "$srcdir/normcst-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/normcst-$pkgver"
  python -m installer "--destdir=$pkgdir" ./dist/*.whl
}
