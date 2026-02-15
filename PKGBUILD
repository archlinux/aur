pkgname=bigsay
pkgver=0.1.1
pkgrel=1
pkgdesc="A high-visibility GTK4 text display tool"
arch=('any')
url="https://github.com/sadneo/bigsay"
license=('MIT')
depends=('python-gobject')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fb72aedda54e358461279db73d82478c9ca4251f176d85b62dcd7fe6add00207')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
