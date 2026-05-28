pkgname=agent-lx-music-bin
pkgver=0.1.9
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
sha256sums_x86_64=('16e0c2ecd5840ef1734217a335730f0d15802a0d44b70a466f526a1449f8261a')
sha256sums_aarch64=('59ec36e1b087b15090925ef1e5fc0fde1a1318714828bf83856952e259c63f53')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
