# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-outdated
pkgver=0.6.2
pkgrel=1
pkgdesc="A cargo subcommand for displaying when Rust dependencies are out of date"
url="https://github.com/kbknapp/cargo-outdated"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/kbknapp/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a8a574fc1906d5e08d52579e664421812f711dcfa5370b6d5adaaac5ed59a62c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
