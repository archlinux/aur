# Maintainer: Dave Nicholson <me@davenicholson.xyz>

pkgname=wallheaven
pkgver=0.2.3
pkgrel=1
pkgdesc='wallheaven is a CLI tool for fetching random wallpapers from wallhaven.cc.'
url='https://github.com/davenicholson-xyz/wallheaven'
license=('MIT')
makedepends=()
depends=()
arch=('x86_64')
source=("https://github.com/davenicholson-xyz/$pkgname/releases/download/v$pkgver/wallheaven-x86_64-unknown-linux-gnu.tar.xz")
noextract=("$pkgname-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=("d9f034c8f552192e745d4953814d80dc842c63f5d6415d981dd2f580fa236e3c")

build() {
  mkdir -p "$srcdir/../build"
  tar -xvf "$srcdir/../$pkgname-x86_64-unknown-linux-gnu.tar.xz" --strip-components=1 -C "$srcdir/../build"
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/../build/wallheaven"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/../build/wallheavend"
}
