pkgname=topoglyph
pkgver=0.1.0
pkgrel=1
pkgdesc="Topology-to-glyph text-art rendering engine"
arch=('x86_64' 'aarch64')
url="https://github.com/Xuepoo/topoglyph"
license=('MIT')
depends=('ffmpeg')
makedepends=('cargo' 'pkgconf' 'clang')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Xuepoo/topoglyph/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('97d1584f9bdf7fc488cd3e24789f08298e4485eacb7818e5574886cbd4146e22')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/topoglyph" "$pkgdir/usr/bin/topoglyph"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
