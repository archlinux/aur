pkgname=pomoru
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal TUI Pomodoro timer with task list"
arch=('x86_64')
url="https://github.com/RanXom/pomoru"
keywords=('pomodoro' 'todo' 'tui')
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a64e186eb1f6e52d805221dd4a094afed6c5a5148b8cb8c8d582fe9d64420f44')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/pomoru "$pkgdir/usr/bin/pomoru"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
