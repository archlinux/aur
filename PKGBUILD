# Maintainer: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cargo-expand
pkgver=0.3.9
pkgrel=1
pkgdesc='Subcommand to show result of macro expansion and `#[derive]` expansion'
arch=('i686' 'x86_64')
url='https://github.com/dtolnay/cargo-expand'
license=('APACHE' 'MIT')
depends=('cargo')
source=("https://github.com/dtolnay/$pkgname/archive/$pkgver.tar.gz")
md5sums=('48b7e3cc488418638dc68a72431e1235')

build() {
  cd "$pkgname-$pkgver" || exit 1
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
