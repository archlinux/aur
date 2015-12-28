# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: issue <issue at archlinux dot info>

pkgname=rust-racer
_pkgname=racer
pkgver=1.1.0
pkgrel=1
pkgdesc="Code completion for Rust"
url="https://github.com/phildawes/racer"
depends=('rust')
optdepends=('rust-src')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/phildawes/$_pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f969e66d5119f544347e9f9424e83d739eef0c75811fa1a5c77e58df621e066d')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/racer "$pkgdir/usr/bin/racer"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
