# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-web
pkgver=0.6.2
pkgrel=1
pkgdesc="A Cargo subcommand for the client-side Web"
url="https://github.com/koute/cargo-web"
depends=('cargo' 'openssl')
optdepends=('chromium: needed for tests')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/koute/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ef1d7f74815b819b41a9502ff06e7c6c2364daadec90170a4fc578b587d05cf2')

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
