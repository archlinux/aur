pkgname=python-asyncinotify
pkgver=4.0.2
pkgrel=1
pkgdesc='A simple optionally-async python inotify library, focused on simplicity of use and operation, and leveraging modern Python features'
arch=(any)
url='https://gitlab.com/Taywee/asyncinotify'
depends=('python')
makedepends=('python-build' 'python-installer')
source=(
  "https://files.pythonhosted.org/packages/5f/0a/7e83ce699393564b198541dbbd86d52f6d78410292e5d1cad84a5cf5ff5e/asyncinotify-$pkgver.tar.gz"
)
sha256sums=(
  'bcac19425b1b418bbbc4d31193ea3c39e24343cd7ddff2074ae7b599f1a04829'
)

build() {
  cd "$srcdir/asyncinotify-$pkgver"
  python -m build --wheel
}

package() {
  cd "$srcdir/asyncinotify-$pkgver"
  python -m installer "--destdir=$pkgdir" "./dist/"*".whl"
}
