# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pocket-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A terminal file manager with previews, playlists and a shared SSH session"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/pocket"
license=('MIT')
depends=('glibc' 'gcc-libs' 'tmux' 'coreutils')
optdepends=(
  'ffmpeg: music tags, waveform previews and host audio playback'
  'glib2: system trash and default-app opening with gio'
  'gvfs: browse, restore and permanently delete items in the system trash'
  'xdg-utils: fallback default-app opening'
  'openssh: connect to a Pocket session from the terminal'
  'sshfs: mount remote hosts and copy or move files between local and SSHFS folders'
)
provides=("pocket=$pkgver")
conflicts=('pocket')
options=('!strip')

source_x86_64=("pocket-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/pocket-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("pocket-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/pocket-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f44cbcee710c12a7d1ea0910cbfb8c3d55b9d58677315b69e7afcd132b31704a')
sha256sums_aarch64=('c44ea216bbfffdc11e994fbc6ccde669e385a8a43f61959b96dc550cab0b2d5e')

package() {
  install -Dm755 pocket "$pkgdir/usr/bin/pocket"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 .github/assets/logo.svg "$pkgdir/usr/share/doc/$pkgname/.github/assets/logo.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 src/parsers/LICENSE "$pkgdir/usr/share/licenses/$pkgname/tree-sitter-LICENSE"
}
