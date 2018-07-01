# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=dutree
pkgver=0.2.8
pkgrel=2
pkgdesc='A tool to analyze file system usage written in Rust'
arch=('x86_64')
url=https://github.com/nachoparker/dutree
license=('GPL3')
makedepends=('cargo')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4d4afe64c928506a214639b2ffc6ac9667036d4b52ea2ee69b2a742624129f45')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

check() {
  cd $pkgname-$pkgver
  cargo test --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
  #install -Dm644 doc/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
}
