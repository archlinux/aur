pkgname=agent-lx-music
pkgver=0.4.0
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence."
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
depends=('alsa-lib' 'mpv')
makedepends=('cargo' 'pkgconf' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/agent-lx-music/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0895ad81638d4195afbad6c262250ee1cdf5608a9ea5b5305052d854d3a7969f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --bin alx
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/alx" "$pkgdir/usr/bin/alx"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
