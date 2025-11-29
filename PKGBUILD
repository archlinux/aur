pkgname=python-asyncinotify
pkgver=4.3.2
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
  '3321deedc443c8402229a423623d3ae2fc17c433b9b9bfe170828ee0c7ea3871'
)

build() {
  cd "$srcdir/asyncinotify-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/asyncinotify-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
}
