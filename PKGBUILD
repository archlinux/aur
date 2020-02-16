# Maintainer: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.7.1'
pkgrel=1
pkgdesc="An exctended 'cp', written in Rust"
arch=('x86_64')
url='https://github.com/tarka/xcp'
license=('GPL-3.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tarka/xcp/archive/v$pkgver.tar.gz")
sha512sums=('0ddcbad1816852654e0be394eeaaccf0d4d627d7655effb2bea3a2ec0da381af0cb63d1006598106a0416ba38cddec48671d3d18f6f97038fef56560cadab608')

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
