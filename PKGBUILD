# Maintainer: svartalf <self@svartalf.info>

pkgname='battop'
pkgdesc="Interactive batteries viewer"
pkgver=0.2.1
pkgrel=1
arch=('x86_64')
url="https://github.com/svartalf/rust-battop"
license=('Apache', 'MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/svartalf/rust-battop/archive/v${pkgver}.tar.gz")
sha512sums=('9fba962cffb9a6b51c5a771d59040db3f63b0735168022677bf647f4dfc095a1d518160475e7b3fced369b06c158786e92c3d54771bc428518ebcd5316dfe4d0')

build() {
  cd "rust-$pkgname-$pkgver"

  cargo build --release --locked
}

package_battop() {
  cd "rust-$pkgname-$pkgver"

  install -D -m755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -D -m644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -D -m644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
