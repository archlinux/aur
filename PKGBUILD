# Maintainer: Dave Nicholson <me@davenicholson.xyz>

pkgname=wallheaven
pkgver=1.1.1
pkgrel=2
pkgdesc='wallheaven is a CLI tool for fetching random wallpapers from wallhaven.cc.'
url='https://github.com/davenicholson-xyz/wallheaven'
license=('MIT')
makedepends=()
depends=()
arch=('x86_64')
source=("https://github.com/davenicholson-xyz/$pkgname/releases/download/v$pkgver/wallheaven-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=("2fd719ddaafdab77885b07fe90c8a98f29f719875a478090777c710c79b5b13c")

build() {
  mkdir -p "$srcdir/../build"
  tar -xvf "$srcdir/../$pkgname-x86_64-unknown-linux-gnu.tar.xz" --strip-components=1 -C "$srcdir/../build"
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/../build/wallheaven"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/../build/wallheavend"
}
