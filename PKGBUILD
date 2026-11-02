
pkgname=opldeck
pkgver=0.8.0
pkgrel=1
pkgdesc="PS2 game library manager for Open PS2 Loader"
arch=('any')
url="https://github.com/petru-sdev/opldeck"
license=('GPL-3.0-only')
depends=(
  'python>=3.11'
  'pyside6'
  'python-py7zr'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
source=("git+https://github.com/petru-sdev/opldeck.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/opldeck"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/opldeck"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
