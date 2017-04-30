# Maintainer: Jian Zeng <anonymousknight96 AT gmail.com>

pkgname=cargo-expand
pkgver=0.3.8
pkgrel=1
pkgdesc='Subcommand to show result of macro expansion and `#[derive]` expansion'
arch=('i686' 'x86_64')
url='https://github.com/dtolnay/cargo-expand'
license=('APACHE' 'MIT')
depends=('cargo')
source=("https://github.com/dtolnay/$pkgname/archive/$pkgver.tar.gz")
md5sums=('324259d98f3822334505d6f0bd8f72ea')

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
