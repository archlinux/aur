# Maintainer: Jennifer Zhou <0@jezh.me>
pkgname=tin-summer
pkgver=1.19.9
pkgrel=1
pkgdesc="Find build artifacts that are taking up disk space"
arch=('x86_64')
url="https://github.com/vmchale/tin-summer"
license=('custom:BSD')
depends=()
makedepends=('rust' 'cargo')
provides=('tin-summer')
source=("git+https://github.com/vmchale/tin-summer.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  cargo build --release
}

check() {
  cd "$srcdir/$pkgname"

  cargo check --release
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m664 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 "target/release/sn" "$pkgdir/usr/bin/sn"
}

# vim:set ts=2 sw=2 et:
