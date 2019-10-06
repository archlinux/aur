# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=dutree
pkgver=0.2.12
pkgrel=1
pkgdesc='A tool to analyze file system usage written in Rust'
arch=('x86_64')
url=https://github.com/nachoparker/dutree
license=('GPL3')
makedepends=('cargo')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6304eaf2ee0913bd0521a351fe5138b3ae44103927655ec43672cadeac559c08')

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
