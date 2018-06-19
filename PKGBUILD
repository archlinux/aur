# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-tally
pkgver=0.2.4
pkgrel=1
pkgdesc="Graph the number of crates that depend on your crate over time"
url="https://github.com/dtolnay/cargo-tally"
depends=('cargo' 'curl' 'http-parser')
optdepends=('gnuplot: display graphs')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dtolnay/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('1a61638cdaef41d61d6fe41ff73be153541e977befeee3a501984603e8c21ff9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
