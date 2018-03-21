# Maintainer: kpcyrd <git@rxv.cc>

pkgname=rshijack
pkgver=0.3.0
pkgrel=1
pkgdesc="tcp connection hijacker, rust rewrite of shijack"
url="https://github.com/kpcyrd/rshijack"
depends=('gcc-libs')
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kpcyrd/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('357d2cf47c73213d24546300c5e90ea01d6bbd196a736fb886ac65a02742ce4ca35f8c4bfd93c3d61ad3e82bdbae10d7b8a82101811cf8fbc96d01299b23007b')

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
