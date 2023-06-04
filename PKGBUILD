# Maintainer: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.10.0'
pkgrel=1
pkgdesc="An exctended 'cp', written in Rust"
arch=('x86_64')
url='https://github.com/tarka/xcp'
license=('GPL-3.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tarka/xcp/archive/v$pkgver.tar.gz")
sha512sums=('14d470060f4a4f50aad7ee78a98bac542e4184b5e510aea6c4bd9fa7af4b1be2fc69b1a1b23c97db20d9d92c4fb49df78bfcca7f356d95283866ebbc16829ef8')

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
