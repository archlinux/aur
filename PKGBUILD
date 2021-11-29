# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=frum-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A little bit fast and modern Ruby version manager written in Rust"
arch=("x86_64")
url="https://github.com/TaKO8Ki/frum"
license=("MIT")
provides=("frum")
conflicts=("frum" "frum-git")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/frum-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('0acd1ffa7fb67cb20284f4ea9d7c18743e7aed3bf0319c7c63ef0e75fcbb0e3b')

package() {
  mkdir -p "$pkgdir/opt/frum"
  mkdir -p "$pkgdir/usr/bin"

  cp -r "$srcdir/frum-v$pkgver-x86_64-unknown-linux-musl/." "$pkgdir/opt/frum"
  ln -s "/opt/frum/frum" "$pkgdir/usr/bin/frum"

  chmod +x "$pkgdir/opt/frum"
}
