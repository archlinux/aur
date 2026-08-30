# Maintainer: user14923929 <user14923929@users.noreply.github.com>
pkgname=highlightforge
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert source code files into syntax-highlighted HTML"
arch=('any')
url="https://github.com/user14923929/highlightforge"
license=('GPL3')
depends=('python' 'python-pygments')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0fb713c04aee4a5a60003a6d07e12f6c5d8b21ef4ad6ef17b4c7b448ce7f62fc')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
