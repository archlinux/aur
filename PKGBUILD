# Maintainer: Riza Mohammad <rizamohammad.work@gmail.com>
pkgname=trix-player
pkgver=1.3.0
pkgrel=1
pkgdesc="A beautiful, keyboard-driven terminal music player for Linux (Binary)."
arch=('x86_64')
url="https://github.com/RIZAmohammadkhan/TerminalMusicPlayer"
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'yt-dlp')
options=('!strip' '!debug')

# Pointing to your .tar.xz binary release
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/trix-player-x86_64-unknown-linux-gnu.tar.xz")

# Generate this using 'updpkgsums'
sha256sums=('d4234e791adf56f28329dbdd5945c25633f74fb6c5b4f49f626c9b8036907326')

package() {
  # Enter the specific subfolder extracted from the tar.xz
  cd "$srcdir/trix-player-x86_64-unknown-linux-gnu"

  # Install the binary
  install -Dm755 "trix" "$pkgdir/usr/bin/trix"
  
  # Install License and Readme
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  
  if [ -f "README.md" ]; then
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi
}
