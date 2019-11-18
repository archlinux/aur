# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=dutree
pkgver=0.2.15
pkgrel=1
pkgdesc='A tool to analyze file system usage written in Rust'
arch=('x86_64')
url=https://github.com/nachoparker/dutree
license=('GPL3')
makedepends=('cargo')
depends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8f5caa4f8e1d261ec3274218196e89319507bf866de6f658829f6a03be58ea83')

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
