# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-tally
pkgver=0.2.0
pkgrel=1
pkgdesc="Graph the number of crates that depend on your crate over time"
url="https://github.com/dtolnay/cargo-tally"
depends=('cargo' 'curl' 'http-parser')
optdepends=('gnuplot: display graphs')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dtolnay/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f6f64533ff0d8cae92fab84fb3218853a304a115040f63fdc52d8763ea5a126b')
sha512sums=('d3ed04ff47009649225d9d703d30f6f1378ed402c73c8539e737325280449c1475320bc7b6fb065c6fdb03e44863d3b0f37a63f3dd164df3b259a39939badc75')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
