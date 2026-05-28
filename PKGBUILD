pkgname=agent-lx-music-bin
pkgver=0.1.5
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
sha256sums_x86_64=('ff78a6c701ac6f8e60bc06c072261772060da42e80ffd03bac0457d19e83ec32')
sha256sums_aarch64=('b729ccd4467d16b8745c95bb497a80170eb8d4689410ba757e9a7b0f3906e7be')

package() {
  install -Dm755 "$srcdir/alx-linux-$CARCH" "$pkgdir/usr/bin/alx"
  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
