# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pocket-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A terminal file manager with previews, playlists and a shared SSH session"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/pocket"
license=('MIT')
depends=('glibc' 'gcc-libs' 'tmux' 'coreutils')
optdepends=(
  'ffmpeg: music tags, waveform previews and host audio playback'
  'glib2: system trash and default-app opening with gio'
  'xdg-utils: fallback default-app opening'
  'openssh: connect to a Pocket session from the terminal'
)
provides=("pocket=$pkgver")
conflicts=('pocket')
options=('!strip')

source_x86_64=("pocket-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/pocket-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("pocket-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/pocket-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('efd8353fe9450388eda1e6d3963d188de2897a56c749f3ee2cae55c0e9bcc9cd')
sha256sums_aarch64=('3bf14fb9aa284128ce462617b1f04b09f36e47c6f3d32bf5081d9baba7cc71d3')

package() {
  install -Dm755 pocket "$pkgdir/usr/bin/pocket"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 logo.svg "$pkgdir/usr/share/doc/$pkgname/logo.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
