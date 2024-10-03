# Maintainer: Dave Nicholson <me@davenicholson.xyz>

pkgname=wallheaven
pkgver=0.3.0
pkgrel=1
pkgdesc='wallheaven is a CLI tool for fetching random wallpapers from wallhaven.cc.'
url='https://github.com/davenicholson-xyz/wallheaven'
license=('MIT')
makedepends=()
depends=()
arch=('x86_64')
source=("https://github.com/davenicholson-xyz/$pkgname/releases/download/v$pkgver/wallheaven-x86_64-unknown-linux-gnu.tar.xz")
noextract=("$pkgname-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=("35731e5a0db6e4cbc887293ec38ca91531d2e85c96a7fc721b7f07c16dda2a3d")

build() {
  mkdir -p "$srcdir/../build"
  tar -xvf "$srcdir/../$pkgname-x86_64-unknown-linux-gnu.tar.xz" --strip-components=1 -C "$srcdir/../build"
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/../build/wallheaven"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/../build/wallheavend"
}
