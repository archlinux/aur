pkgname=topoglyph
pkgver=0.3.5
pkgrel=1
pkgdesc="Topology-to-glyph text-art rendering engine"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/topoglyph"
license=('MIT')
depends=('ffmpeg')
makedepends=('cargo' 'pkgconf' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/topoglyph/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d9507ed7b05f2985c97a615ea6b4cea95c4ad483c772d5c534edfdbbcf9cfae1')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/topoglyph" "$pkgdir/usr/bin/topoglyph"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
