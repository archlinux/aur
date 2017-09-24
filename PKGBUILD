# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-outdated
pkgver=0.5.1
pkgrel=1
pkgdesc="A cargo subcommand for displaying when Rust dependencies are out of date"
url="https://github.com/kbknapp/cargo-outdated"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/kbknapp/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8c4c45cf02bef27a22cf385c9de19f9ddfa5648a6350169597b2e9ed020dafd4')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
