pkgname=agent-lx-music
pkgver=0.1.9
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence."
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
depends=('alsa-lib' 'mpv')
makedepends=('cargo' 'pkgconf' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/agent-lx-music/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e624ae323cd506193f5d8eb1c6ba61bee6c7be253d83dcffc53e5771d48f8d9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --bin alx
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/alx" "$pkgdir/usr/bin/alx"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
