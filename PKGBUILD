pkgname=agent-lx-music
pkgver=0.4.1
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence."
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
depends=('alsa-lib' 'mpv')
makedepends=('cargo' 'pkgconf' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/agent-lx-music/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('18f9b52d142b1d83209584ea6f7afba860cf1dc8f13b499ef1fcbe512aeb4368')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --bin alx
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/alx" "$pkgdir/usr/bin/alx"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
