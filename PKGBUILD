# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-web
pkgver=0.4.4
pkgrel=1
pkgdesc="A Cargo subcommand for the client-side Web"
url="https://github.com/koute/cargo-web"
depends=('cargo' 'gcc-libs')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/koute/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('b8b573d4199ca0a1e889cc7be70dfe95d9dec2488cf7dc3c65379c4882a6f1b1df3e6c77dfc2aed02a4bf88b5f7e5eaf59c2a6d54cae9fdee63ff0da052148a6')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
