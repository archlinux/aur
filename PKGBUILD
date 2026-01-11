# Maintainer: Your Name <your.email@example.com>
pkgname=bootwhy
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight CLI tool for analyzing Linux boot performance"
arch=('any')
url="https://github.com/yourusername/bootwhy"
license=('GPL3')
depends=('python' 'systemd')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with actual checksum after creating release

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
