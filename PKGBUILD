# Maintainer: David Jetelina <sour.soap5197@jtl.email>
pkgname=cheznav
pkgver=0.3.0
pkgrel=1
pkgdesc="TUI for chezmoi"
arch=('any')
url="https://github.com/djetelina/cheznav"
license=('MIT')
depends=(
  'python>=3.14'
  'python-textual'
  'chezmoi'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-uv-build'
  'python-wheel'
)
source=("cheznav-$pkgver.tar.gz::https://github.com/djetelina/cheznav/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cfcd913dda70464e52e4ee88088d2183d7e720ee24b926201c36fe568373e22e')

build() {
  cd "cheznav-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "cheznav-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
