pkgname=agent-lx-music-bin
pkgver=0.1.7
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
sha256sums_x86_64=('85da3c60d7100650f580ae1f4b8ff09f3b4555637bcd755129c007c1f3ed3860')
sha256sums_aarch64=('0da450a995c7ff111e629a8066af423d985f7ca2199b20baa0d16a7704670614')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
