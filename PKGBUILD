# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=dutree
pkgver=0.2.11
pkgrel=1
pkgdesc='A tool to analyze file system usage written in Rust'
arch=('x86_64')
url=https://github.com/nachoparker/dutree
license=('GPL3')
makedepends=('cargo')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('370aad6d368fc4e702359ab5e3cb27225e127bea875294e27dc2262b1abbd7e5')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
}
