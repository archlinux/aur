pkgname=ayaan
pkgver=0.1.2
pkgrel=3
pkgdesc="AyaanScript+ runtime and ASPKG package manager"
arch=('x86_64')
url="https://github.com/ayaan511/AyaanScriptPlus"
license=('MIT')

makedepends=('rust' 'cargo')
depends=('gcc-libs' 'openssl')

source=("https://github.com/ayaan511/AyaanScriptPlus/releases/download/nope/ayaanscript-0.1.0.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir"
  cargo build --release --target-dir "$srcdir/target"
}

package() {
  install -Dm755 "$srcdir/target/release/ayaan" "$pkgdir/usr/bin/ayaan"
  install -Dm755 "$srcdir/target/release/aspkg" "$pkgdir/usr/bin/aspkg"
}
