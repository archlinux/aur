# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=frum-bin
pkgver=0.1.0+alpha.0
_pkgver=0.1.0-alpha.0
pkgrel=1
pkgdesc="A little bit fast and modern Ruby version manager written in Rust"
arch=("x86_64")
url="https://github.com/TaKO8Ki/frum"
license=("MIT")
provides=("frum")
conflicts=("frum" "frum-git")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$_pkgver/frum-v$_pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("a495ddf28e9cc7da20b9f823eff8cfa7248dc992a247ca5fb5c369cf5c8027ce")

package() {
  mkdir -p "$pkgdir/opt/frum"
  mkdir -p "$pkgdir/usr/bin"

  cp -r "$srcdir/frum-v$_pkgver-x86_64-unknown-linux-musl/." "$pkgdir/opt/frum"
  ln -s "$pkgdir/opt/frum/frum" "$pkgdir/usr/bin/frum"

  chmod +x "$pkgdir/opt/frum"
}
