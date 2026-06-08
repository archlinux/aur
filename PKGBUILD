pkgname=petiglyph
pkgver=0.1.1
pkgrel=1
pkgdesc='petiglyph is a TUI and CLI tool for turning images and videos into custom font glyphs'
arch=('x86_64')
url='https://github.com/petipoua/petiglyph'
license=('MIT')
depends=('ffmpeg' 'fontconfig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/petipoua/petiglyph/archive/refs/tags/v0.1.1.tar.gz")
sha256sums=('d071f1969f23d6365eacb66403a4013acd72764eae0947fdabb181cbb094ef3c')

build() {
  cd "$srcdir/petiglyph-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/petiglyph-$pkgver"
  install -Dm755 target/release/petiglyph "$pkgdir/usr/bin/petiglyph"
  install -Dm644 README.md "$pkgdir/usr/share/doc/petiglyph/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/petiglyph/LICENSE"
}
