# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-outdated
pkgver=0.1.1
pkgrel=1
pkgdesc="A cargo subcommand for displaying when Rust dependencies are out of date"
url="https://github.com/kbknapp/cargo-outdated"
depends=('cargo')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/kbknapp/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('282b407e41dd984d5195215cba705f7f44882d0261d69e1104c8980463c887bc')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
