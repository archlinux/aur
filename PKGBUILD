# Maintainer: ftilde <ftilde at tamepointer dot tld for germany>
pkgname=handlr
pkgver=0.6.4
pkgrel=1
pkgdesc="Powerful alternative to xdg-utils written in Rust"
arch=('x86_64')
url="https://github.com/chmln/handlr"
license=('MIT')
makedepends=('cargo')
provides=('handlr')
conflicts=('handlr-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chmln/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('55779ad0c01e065678e1a57f338272f1d38057658fe6b7c54f7bc35595575aafe13aed6ca3d80cc65b912971aac9a2a6c78ac5512315af9f2d676a92c8c395ec')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 target/release/handlr "$pkgdir/usr/bin/handlr"
  install -Dm 755 completions/handlr.fish "$pkgdir/usr/share/fish/vendor_completions.d/handlr.fish"
  install -Dm 755 completions/_handlr "$pkgdir/usr/share/zsh/site-functions/_handlr"
}
