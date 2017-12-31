# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-web
pkgver=0.4.2
pkgrel=1
pkgdesc="A Cargo subcommand for the client-side Web"
url="https://github.com/koute/cargo-web"
depends=('cargo' 'gcc-libs')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/koute/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('553976137596b2e49518b27607155aa22f2a6df10b5302408bee71eb1fb39b0af45a3173d93933a8e7c2bb414572cd81937f228a41ce00a164cb6041c6ec98c9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
