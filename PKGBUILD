# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-outdated
pkgver=0.1.3
pkgrel=1
pkgdesc="A cargo subcommand for displaying when Rust dependencies are out of date"
url="https://github.com/kbknapp/cargo-outdated"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("https://github.com/kbknapp/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0ac02409ddada8dff62ad5a0845773604ac039f8ea2d037ae29d7f4acfb375b0')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
