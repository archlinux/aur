# Maintainer: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.7.2'
pkgrel=1
pkgdesc="An exctended 'cp', written in Rust"
arch=('x86_64')
url='https://github.com/tarka/xcp'
license=('GPL-3.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tarka/xcp/archive/v$pkgver.tar.gz")
sha512sums=('1ef0238a502472295a56ce38629874ce069b63b91b4aaaa9a4bd597a9ff9031b761ae609f6142bcf3073987497ac4397c2b4747b8070323504e154dda78235e5')

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
