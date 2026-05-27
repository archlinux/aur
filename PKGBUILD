pkgname=agent-lx-music-bin
pkgver=0.1.2
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
sha256sums_x86_64=('58d4f43b0d68476a14110cae4db19601c593990ed7bd028271ed51f9120be90d')
sha256sums_aarch64=('7ec1674f03021b34a1397d640a336d13a7a9c0578f431ab70232f5df9600e4fb')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
