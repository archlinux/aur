pkgname=pomoru
pkgver=0.1.1
pkgrel=1
pkgdesc="Minimal TUI Pomodoro timer with task list"
arch=('x86_64')
url="https://github.com/RanXom/pomoru"
keywords=('pomodoro' 'todo' 'tui')
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e4ce914f2b67ec8be73febd2448f5618a317bff714afe11ea70eed4da646a227')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/pomoru "$pkgdir/usr/bin/pomoru"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
