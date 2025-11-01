# Maintainer: Mr_fox <youremail@example.com>

pkgname=igrok
pkgver=1.0.0
pkgrel=1
pkgdesc="Play YouTube audio with real-time visualization using mpv, yt-dlp, and cava"
arch=('x86_64')
url="https://github.com/mrwildfoxgamer/Igrok"
license=('MIT')
depends=('yt-dlp' 'mpv' 'cava')
makedepends=('rust' 'cargo')
source=("$url/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Igrok-main"
  cargo build --release
}

package() {
  cd "$srcdir/Igrok-main"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
