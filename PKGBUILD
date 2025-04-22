pkgname="python-atcoder-tools-git"
pkgver=r358.f3c8423
pkgrel=1
pkgdesc="Convenient modules & tools for AtCoder users, written in Python 3.6"
arch=('any')
url="https://github.com/kyuridenamida/atcoder-tools"
license=('MIT')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-requests'
  'python-colorama'
  'python-toml'
  'python-jinja'
)
makedepends=('git' 'python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/kyuridenamida/atcoder-tools.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/atcoder-tools"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/atcoder-tools"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/atcoder-tools"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
