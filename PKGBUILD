pkgname=agent-lx-music
pkgver=0.2.0
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence."
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
depends=('alsa-lib' 'mpv')
makedepends=('cargo' 'pkgconf' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/agent-lx-music/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83f7231a3bb55afed3fb56af5b3ff6050a839aa61e55bca7b0874dbd6b52f40b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --bin alx
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/alx" "$pkgdir/usr/bin/alx"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
