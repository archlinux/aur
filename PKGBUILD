pkgname=topoglyph
pkgver=0.2.0
pkgrel=1
pkgdesc="Topology-to-glyph text-art rendering engine"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/topoglyph"
license=('MIT')
depends=('ffmpeg')
makedepends=('cargo' 'pkgconf' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/topoglyph/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9862f3d3c27c43fe661050dc736625e3cb35f18777d3612002332003cd049328')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/topoglyph" "$pkgdir/usr/bin/topoglyph"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
