# Maintainer: Dave Nicholson <me@davenicholson.xyz>

pkgname=wallheaven
pkgver=0.1.6
pkgrel=1
pkgdesc='wallheaven is a CLI tool for fetching random wallpapers from wallhaven.cc.'
url='https://github.com/davenicholson-xyz/wallheaven'
license=('MIT')
makedepends=()
depends=()
arch=('x86_64')
source=("https://github.com/davenicholson-xyz/$pkgname/releases/download/v$pkgver/wallheaven-x86_64-unknown-linux-gnu.tar.xz")
noextract=("$pkgname-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=("bb8a83a2c7610488259d1a8cf6856dfda4761cd604993b971d1c3295ab6addc9")

build() {
  mkdir -p "$srcdir/../build"
  tar -xvf "$srcdir/../$pkgname-x86_64-unknown-linux-gnu.tar.xz" --strip-components=1 -C "$srcdir/../build"
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/../build/$pkgname"
}
