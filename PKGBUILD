# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=allsorts-tools
pkgver=0.11.0
pkgrel=1
pkgdesc='Font debugging tools based on the Allsorts font shaping engine'
arch=('i686' 'x86_64')
url="https://github.com/yeslogic/allsorts-tools"
license=('Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('95393ac38ef4bb9094a40c2f5e05054dc35fa42f1e59377315503eb7df2cfc6f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/allsorts" "$pkgdir/usr/bin/allsorts"
}
