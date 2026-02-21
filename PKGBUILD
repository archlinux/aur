pkgname=ayaan
# Maintainer: Ayaan ayaanhassan511@gmail.com

pkgname=ayaan
pkgver=1.33.0
pkgrel=1
pkgdesc="AyaanScriptPlus runtime and ASPKG package manager"
arch=('x86_64')
url="https://github.com/ayaan511/AyaanScriptPlus"
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("https://github.com/ayaan511/AyaanScriptPlus/releases/download/v$pkgver/AyaanScriptPlus-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/AyaanScriptPlus-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/AyaanScriptPlus-$pkgver"

  install -Dm755 target/release/ayaan "$pkgdir/usr/bin/ayaan"
  install -Dm755 target/release/aspkg "$pkgdir/usr/bin/aspkg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
