# Maintainer: LoricAndre <perso@loric.eu>

_pkgname=yrice
pkgname=yrice
pkgver=1.0.0
pkgrel=1
pkgdesc='A dotfile manager based on a single yaml fiel written in Rust'
arch=(x86_64)
url="https://github.com/LoricAndre/$_pkgname"
makedepends=(cargo)
_archive="$_pkgname-$pkgver"
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b4f002c251054cdeddffc538af5a89a142381a199a12764bce7d5581f4911fc9')


build() {
  cd "$_archive"
  cargo build --release
}

package() {
  cd "$_archive"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
