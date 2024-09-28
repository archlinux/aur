# Maintainer: Dave Nicholson <me@davenicholson.xyz>

pkgname=wallheaven
pkgver=0.2.4
pkgrel=1
pkgdesc='wallheaven is a CLI tool for fetching random wallpapers from wallhaven.cc.'
url='https://github.com/davenicholson-xyz/wallheaven'
license=('MIT')
makedepends=()
depends=()
arch=('x86_64')
source=("https://github.com/davenicholson-xyz/$pkgname/releases/download/v$pkgver/wallheaven-x86_64-unknown-linux-gnu.tar.xz")
noextract=("$pkgname-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=("138a2a1eef2734361b3bb463510ab5dbfb941a6a1b605e725e9a6bc7f6a76f86")

build() {
  mkdir -p "$srcdir/../build"
  tar -xvf "$srcdir/../$pkgname-x86_64-unknown-linux-gnu.tar.xz" --strip-components=1 -C "$srcdir/../build"
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/../build/wallheaven"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/../build/wallheavend"
}
