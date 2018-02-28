# Maintainer: kpcyrd <git@rxv.cc>

pkgname=rshijack
pkgver=0.2.0
pkgrel=1
pkgdesc="tcp connection hijacker, rust rewrite of shijack"
url="https://github.com/kpcyrd/rshijack"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kpcyrd/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('db632140c3f537dcfc5dba142c995a4c73ab60276138588cd9c7ca96f1840dd3af4eab146a0a2c4ea100b1674da1e57cea0cb5b80b09b549ebee46af9cbf9a9f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
