# Collaborator: Vlad M. <vlad@archlinux.net>
# Maintainer: Jian Zeng <anonymousknight96+aur AT gmail.com>, Alexandre Bury <alexandre.bury+aur AT gmail.com>

pkgname=cargo-outdated
pkgver=0.8.0
pkgrel=1
pkgdesc="A cargo subcommand for displaying when Rust dependencies are out of date"
url="https://github.com/kbknapp/cargo-outdated"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
# Use crates.io download when available (at this time 0.8.0 is not published)
#source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
source=("https://github.com/kbknapp/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")


sha256sums=('6e07552706cdebceaf5b03bcd022082cdafca70e8e095a74ace95c767e39d509')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
