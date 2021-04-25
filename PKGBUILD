# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=frum-bin
pkgver=0.1.0+alpha.1
_pkgver=0.1.0-alpha.1
pkgrel=1
pkgdesc="A little bit fast and modern Ruby version manager written in Rust"
arch=("x86_64")
url="https://github.com/TaKO8Ki/frum"
license=("MIT")
provides=("frum")
conflicts=("frum" "frum-git")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$_pkgver/frum-v$_pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("82530f26be8113c7dd1a43398ea2f45c1e06d4e1c0af203a236d81145015112c")

package() {
  mkdir -p "$pkgdir/opt/frum"
  mkdir -p "$pkgdir/usr/bin"

  cp -r "$srcdir/frum-v$_pkgver-x86_64-unknown-linux-musl/." "$pkgdir/opt/frum"
  ln -s "/opt/frum/frum" "$pkgdir/usr/bin/frum"

  chmod +x "$pkgdir/opt/frum"
}
