# Collaborator: Vlad M. <vlad@archlinux.net>
# Maintainer: Jian Zeng <anonymousknight96+aur AT gmail.com>

pkgname=cargo-outdated
pkgver=0.7.0
pkgrel=1
pkgdesc="A cargo subcommand for displaying when Rust dependencies are out of date"
url="https://github.com/kbknapp/cargo-outdated"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/kbknapp/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('771f35ea3d68677248c83fe01c2c6545b0d3f99deeee062b4704a59b67b263df')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
