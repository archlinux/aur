# Maintainer: Stas Rudakou <stas at garage22 dot net>

pkgname=cobalt
_cratename=cobalt-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Static site generator written in Rust"
url="https://github.com/cobalt-org/cobalt.rs"
makedepends=('cargo')
depends=('openssl')
arch=('i686' 'x86_64')
license=('MIT')
source=("$_cratename-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_cratename/$pkgver/download")
sha256sums=('b0363ffc41f133a467ba059efdfa0c853719abe2482989e9e3622a0dfcacb46e')

build() {
  cd "$_cratename-$pkgver"
  cargo build --release
}

package() {
  cd "$_cratename-$pkgver"
  install -Dm755 target/release/cobalt "$pkgdir/usr/bin/cobalt"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
