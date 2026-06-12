pkgname=pomoru
pkgver=1.1.0
pkgrel=1
pkgdesc="Minimal TUI Pomodoro timer with task list"
arch=('x86_64')
url="https://github.com/RanXom/pomoru"
keywords=('pomodoro' 'todo' 'tui')
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e49d45ce62873a81faf0e61760bd2ac1fc744c47cc49173c222ecaa8bced2942')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/pomoru "$pkgdir/usr/bin/pomoru"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
