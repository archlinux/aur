# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-bloat
pkgver=0.4.0
pkgrel=1
pkgdesc="Find out what takes most of the space in your executable"
url="https://github.com/RazrFalcon/cargo-bloat"
depends=('cargo' 'http-parser' 'curl')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RazrFalcon/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ed244ce82f96b0ef9f38a6cc5fadc77be28df23721c5eaed74cfd01c136e457f')

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
