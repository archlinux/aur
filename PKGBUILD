pkgname=realm
pkgver=2.3.4
pkgrel=1
pkgdesc="A simple, high performance relay server written in rust."
url="https://github.com/zhboner/realm"
arch=(x86_64)
license=(MIT)
makedepends=(cargo-nightly)
source=("https://github.com/zhboner/realm/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir/usr/bin" target/release/$pkgname
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 readme.md
}