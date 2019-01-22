# Maintainer: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.3.0'
pkgrel=1
pkgdesc="An exctended 'cp', written in Rust"
arch=('x86_64')
url='https://github.com/tarka/xcp'
license=('GPL-3.0')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cargo')
source=("$pkgname-$pkgver::https://github.com/tarka/xcp/archive/$pkgver.tar.gz")
sha512sums=('e9c55e27f228312021423a3a9955f50178f6fbe8d9254a2f09b658c82e3d2cc4fefbdb9e1766e797a65c581bd88301c93ea15fa8faac35eaf351116ff1c08d1a')

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
