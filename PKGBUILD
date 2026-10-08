# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=pocket-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal file manager with previews, playlists and a shared SSH session"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/pocket"
license=('LicenseRef-unknown')
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
sha256sums_x86_64=('0e0d677483fa9ed0430d8e7010b2978d6b572ffe44436b7ab38e29d6c9374f8c')
sha256sums_aarch64=('6ee20b613f8514a413180225362cc6a857a9f4ee3d9ed0edbcfd6e13c2361190')

package() {
  install -Dm755 pocket "$pkgdir/usr/bin/pocket"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 logo.svg "$pkgdir/usr/share/doc/$pkgname/logo.svg"
}
