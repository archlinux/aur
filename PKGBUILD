# Maintainer: David Jetelina <sour.soap5197@jtl.email>
pkgname=cheznav
pkgver=0.1.1
pkgrel=1
pkgdesc="TUI for chezmoi"
arch=('any')
url="https://github.com/djetelina/cheznav"
license=('MIT')
depends=(
  'python>=3.14'
  'python-textual'
  'python-rich'
  'python-pygments'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-uv-build'
  'python-wheel'
)
source=("cheznav-$pkgver.tar.gz::https://github.com/djetelina/cheznav/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a583d1a461f05c37c6a6bf7e03d5aea44a88d219c3ed9c1432c47d4b24f1b2f5')

build() {
  cd "cheznav-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "cheznav-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
