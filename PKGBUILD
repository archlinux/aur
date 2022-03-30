# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=allsorts-tools
pkgver=0.7.0
pkgrel=1
pkgdesc='Font debugging tools based on the Allsorts font shaping engine'
arch=('i686' 'x86_64')
url="https://github.com/yeslogic/allsorts-tools"
license=('Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e52920aa6bd02c9794f3b0044ab36273c46077ca4291b15bab865f9b665a391f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/allsorts" "$pkgdir/usr/bin/allsorts"
}
