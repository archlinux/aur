# Maintainer: Kam1k4dze <me@kam1k4dze.com>
pkgname=inspect-deps
pkgver=0.1.0
pkgrel=1
pkgdesc="ELF dependency analyzer for Arch Linux"
arch=('any')
url="https://github.com/Kam1k4dze/inspect-deps"
license=('MIT')
depends=('python' 'binutils' 'pacman')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33becf070fa434889c5d744927df6f995ef8646e6871cc36fff4527debdc1374')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

