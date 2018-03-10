# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-local-registry
pkgver=0.1.5
pkgrel=1
pkgdesc="A cargo subcommand to manage local registries"
url="https://github.com/alexcrichton/cargo-local-registry"
depends=('cargo' 'http-parser' 'curl')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexcrichton/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('c021cd849dc7bf1c3f898a8924be098282a968482bf5059af46213cf25d22b59d3b66dea6ca9399cd1e9b501f680e11e1025879c86a493dfdf70ca99f9e17846')

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
