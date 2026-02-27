# Maintainer: ジュレス (juresu) <jullespio@users.noreply.github.com>
pkgname=rajio-sen
pkgver=1.2.0
pkgrel=1
pkgdesc="A minimalist vaporwave-inspired pirate radio scanner for the terminal."
arch=('any')
url="https://github.com/jullespio/rajio-sen"
license=('MIT')
depends=('python' 'python-requests' 'python-rich' 'python-pick')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jullespio/rajio-sen/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2765ac712ae791de2f8046515c53b40d24be672f1f4e5ed6bd4c9ef7dfa92f66')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
