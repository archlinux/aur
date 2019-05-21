# Maintainer: svartalf <self@svartalf.info>

pkgname='battop'
pkgdesc="Interactive batteries viewer"
pkgver=0.2.2
pkgrel=1
arch=('x86_64')
url="https://github.com/svartalf/rust-battop"
license=('Apache', 'MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/svartalf/rust-battop/archive/v${pkgver}.tar.gz")
sha512sums=('41af5213c39fe6d50b34da276a43cf49ac64649be1bcfb5bc269ce60b938cecb6e71c3893d99a9f7f7e25b7978a9abe9d3c9eecaf1761d58c5fddb393fe25877')

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
