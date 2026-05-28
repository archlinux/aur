pkgname=agent-lx-music-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="A terminal-native music CLI replacing lx-music-desktop, powered by Agentic intelligence. (Pre-compiled)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/agent-lx-music"
license=('MIT')
depends=('alsa-lib' 'mpv')
provides=('agent-lx-music')
conflicts=('agent-lx-music')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Xuepoo/agent-lx-music/v$pkgver/LICENSE")
source_x86_64=("https://github.com/Xuepoo/agent-lx-music/releases/download/v$pkgver/alx-linux-x86_64")
source_aarch64=("https://github.com/Xuepoo/agent-lx-music/releases/download/v$pkgver/alx-linux-aarch64")

sha256sums=('51b96fe87205eedde58a4da8fda83a5d23df4c3dfc54e7af76ecf430f9e50201')
sha256sums_x86_64=('9193fe8ce09de4c7f14f881de8767cdc5d438df3b732713bde712633757ffb18')
sha256sums_aarch64=('210bd1d041ac897a64a9022d02a51ae83bd0455efab6981178bd7c25eb9bfbc8')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
