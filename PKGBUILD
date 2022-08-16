# Maintainer: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.9.1'
pkgrel=1
pkgdesc="An exctended 'cp', written in Rust"
arch=('x86_64')
url='https://github.com/tarka/xcp'
license=('GPL-3.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tarka/xcp/archive/v$pkgver.tar.gz")
sha512sums=('8801eb5c62b969c9f6189e1a3856fb5414a191bb5951851dc85feacbf00d4b1b34b81c0e88c33e7a2e4dd8746e8832c89512a928436d89f1e1813b745d2ad7fe')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/xcp
}
