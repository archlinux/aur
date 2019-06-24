# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=miniserve
pkgver=0.5.0
pkgrel=1
pkgdesc="Tool to serve files via HTTP"
arch=('x86_64')
url="https://github.com/svenstaro/miniserve"
license=(MIT)
makedepends=(cargo)
source=(https://github.com/svenstaro/miniserve/archive/v${pkgver}.tar.gz)
sha512sums=('36654ab83018fb4e3cdb175f8d89fff96a6d332abe0c0ca94b38e248a85b21f144d132a089ed266f99236ab9cb2c0c167309e7b0ddc551b717d4b8bd6a9e75fc')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/miniserve "$pkgdir"/usr/bin/miniserve
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
