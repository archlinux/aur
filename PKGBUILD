# Maintainer: kpcyrd <git@rxv.cc>

pkgname=wasm-gc
pkgver=0.1.0
pkgrel=1
pkgdesc="gc-sections for wasm"
url="https://github.com/alexcrichton/wasm-gc"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexcrichton/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('0c97758fa4aeab58eef700523d933a1b87eac79bf91417f7806873d307d4ce73e6289574bb3d9329b500a8d1fe2d564ac3387aeb6463929b9e4f4e1dbc314ecb')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
