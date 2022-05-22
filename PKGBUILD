# Maintainer: LoricAndre <perso@loric.eu>

_pkgname=yrice
pkgname=yrice
pkgver=1.1.0
pkgrel=1
pkgdesc='A dotfile manager based on a single yaml fiel written in Rust'
arch=(x86_64)
url="https://github.com/LoricAndre/$_pkgname"
makedepends=(cargo)
_archive="$_pkgname-$pkgver"
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2b0e58def84d9d1659368837c4e51fb604dda9fce9097eee39e779c381b947fd')


build() {
  cd "$_archive"
  cargo build --release
}

package() {
  cd "$_archive"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
