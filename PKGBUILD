pkgname=python-asyncinotify
pkgver=4.2.1
pkgrel=1
pkgdesc='A simple optionally-async python inotify library, focused on simplicity of use and operation, and leveraging modern Python features'
arch=(any)
url='https://github.com/ProCern/asyncinotify'
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core')
source=(
  "https://pypi.io/packages/source/a/asyncinotify/asyncinotify-$pkgver.tar.gz"
)
sha256sums=(
  '8078b0b0d81c19043141ab0fc5654e89a4d3023dc3e4486aaa245b1ff5f5ddc9'
)

build() {
  cd "$srcdir/asyncinotify-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/asyncinotify-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
}
