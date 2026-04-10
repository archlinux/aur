# Maintainer: David Jetelina <sour.soap5197@jtl.email>
pkgname=cheznav
pkgver=0.2.0
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
sha256sums=('b6978e23e84956cb69a18f24654b7b048ac92a252a4807ae2b31dfc71692f60f')

build() {
  cd "cheznav-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "cheznav-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
