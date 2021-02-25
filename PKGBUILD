# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=proxyboi
pkgver=0.4.5
pkgrel=1
pkgdesc="A super simple reverse proxy with TLS support"
arch=('x86_64')
url="https://github.com/svenstaro/proxyboi"
license=(MIT)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::https://github.com/svenstaro/proxyboi/archive/v${pkgver}.tar.gz)
sha512sums=('9d992d267d22404cb1edba0d3a57d41885ea549e9bda68f024db0d5ecf9b3ec67ae8fc0d8998640e4e5ae783433d170f7895b0f6e5907ccddbe4c0402f1e87a9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/proxyboi "$pkgdir"/usr/bin/proxyboi
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
