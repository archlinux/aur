# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: issue <issue at archlinux dot info>

pkgname=rust-racer
_pkgname=racer
pkgver=1.2.4
pkgrel=1
pkgdesc="Code completion for Rust"
url="https://github.com/phildawes/racer"
optdepends=('rust-src')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('26ab596b4f886fa7f51de845c8bac5ac9232bb82523ed21c70aaa211b3a1082d')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/racer "$pkgdir/usr/bin/racer"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
