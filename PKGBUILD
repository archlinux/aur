# Maintainer: Riza Mohammad <rizamohammad.work@gmail.com>
pkgname=trix-player-bin
_pkgname=trix-player
pkgver=1.0.0
pkgrel=1
pkgdesc="A beautiful, keyboard-driven terminal music player for Linux (Pre-compiled binary)."
arch=('x86_64')
url="https://github.com/RIZAmohammadkhan/TerminalMusicPlayer"
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")

# This line prevents the creation of the unwanted -debug package
options=('!strip' '!debug')

source=("$_pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/trix-player-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('f1451d6bff782eb225d0e724d349c43c358f320528d64a87b193304929c3e8c9')

package() {
  cd "$srcdir/trix-player-x86_64-unknown-linux-gnu"
  install -Dm755 "trix" "$pkgdir/usr/bin/trix"
  
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
