# Maintainer: svartalf <self@svartalf.info>

pkgname='battop'
pkgdesc="Interactive batteries viewer"
pkgver=0.2.3
pkgrel=1
arch=('x86_64')
url="https://github.com/svartalf/rust-battop"
license=('Apache', 'MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/svartalf/rust-battop/archive/v${pkgver}.tar.gz")
sha512sums=('d42095a3f296f2a8b444504158dbb17f98a667b88a9fe5713c23df7b1f16a509aa2bf911cd243eaf5d2565d6211f2b36003cdf3253142de5d4637def0934cca6')

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
