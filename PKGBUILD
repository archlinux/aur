# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-web
pkgver=0.4.0
pkgrel=1
pkgdesc="A Cargo subcommand for the client-side Web"
url="https://github.com/koute/cargo-web"
depends=('cargo' 'gcc-libs')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/koute/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('07c1fb063b01a0ebd2a303005295523dde514aaa56ed42216ae708559cfccf77a9169beaa923b92a0060dc762c3bc12eb29a05f05a6cf92230f9241144713571')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
