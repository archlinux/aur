# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=frum-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A little bit fast and modern Ruby version manager written in Rust"
arch=("x86_64")
url="https://github.com/TaKO8Ki/frum"
license=("MIT")
provides=("frum")
conflicts=("frum" "frum-git")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/frum-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("95af67115f69ae8979e2ec51635298ad5803ef38d6a79ae2a2b967e00e49ea29")

package() {
  mkdir -p "$pkgdir/opt/frum"
  mkdir -p "$pkgdir/usr/bin"

  cp -r "$srcdir/frum-v$pkgver-x86_64-unknown-linux-musl/." "$pkgdir/opt/frum"
  ln -s "/opt/frum/frum" "$pkgdir/usr/bin/frum"

  chmod +x "$pkgdir/opt/frum"
}
