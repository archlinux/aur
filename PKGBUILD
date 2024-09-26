pkgname=python-asyncinotify
pkgver=4.1.0
pkgrel=1
pkgdesc='A simple optionally-async python inotify library, focused on simplicity of use and operation, and leveraging modern Python features'
arch=(any)
url='https://gitlab.com/Taywee/asyncinotify'
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core')
source=(
  "https://pypi.io/packages/source/a/asyncinotify/asyncinotify-$pkgver.tar.gz"
)
sha256sums=(
  '41743900519ebdefe53e751df1d39689aca88794d783af945d306348a1398501'
)

build() {
  cd "$srcdir/asyncinotify-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/asyncinotify-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
}
