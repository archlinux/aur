# Collaborator: Vlad M. <vlad@archlinux.net>
# Maintainer: Jian Zeng <anonymousknight96+aur AT gmail.com>

pkgname=cargo-outdated
pkgver=0.7.1
pkgrel=1
pkgdesc="A cargo subcommand for displaying when Rust dependencies are out of date"
url="https://github.com/kbknapp/cargo-outdated"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.crate::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=('3dfd9bf724f19c30dc9cb933a967746113e1c8283ab195ce44dd7ac9a8579180')

prepare() {
    tar xf $pkgname-$pkgver.crate
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
