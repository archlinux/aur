pkgname=topoglyph
pkgver=0.2.2
pkgrel=1
pkgdesc="Topology-to-glyph text-art rendering engine"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/topoglyph"
license=('MIT')
depends=('ffmpeg')
makedepends=('cargo' 'pkgconf' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/topoglyph/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2af5cc067efd4720b02859bd5da7f231ac65bd1bbe6653a7ab5930c8da22c9a9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/topoglyph" "$pkgdir/usr/bin/topoglyph"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
