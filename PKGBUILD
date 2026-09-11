pkgname=pomoru
pkgver=1.2.0
pkgrel=1
pkgdesc="Minimal TUI Pomodoro timer with task list"
arch=('x86_64')
url="https://github.com/RanXom/pomoru"
keywords=('pomodoro' 'todo' 'tui')
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7d66be138fd8e640acf535c1fd195356750f3262311e268eeb4678d9f713bc00')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/pomoru "$pkgdir/usr/bin/pomoru"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
