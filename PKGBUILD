# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-bloat
pkgver=0.5.1
pkgrel=1
pkgdesc="Find out what takes most of the space in your executable"
url="https://github.com/RazrFalcon/cargo-bloat"
depends=('cargo' 'http-parser' 'curl')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RazrFalcon/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('71e351ab504f45103e2c1d8336c7369d5a176e5294ca0f018326cea89de927b1')

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
