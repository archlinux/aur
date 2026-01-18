pkgname=pomoru
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal TUI Pomodoro timer with task list"
arch=('x86_64')
url="https://github.com/RanXom/pomoru"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d860778b9b9227da0723dece5ff0278969864039d748f43682b5044bf16c09e7')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/pomoru "$pkgdir/usr/bin/pomoru"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
