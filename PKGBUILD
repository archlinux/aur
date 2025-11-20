# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=allsorts-tools
pkgver=0.13.0
pkgrel=1
pkgdesc='Font debugging tools based on the Allsorts font shaping engine'
arch=('i686' 'x86_64')
url="https://github.com/yeslogic/allsorts-tools"
license=('Apache-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d09eaca87e2da4951629332cd59b243dd5e5080ff69aa52455374391086ebf59')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/allsorts" "$pkgdir/usr/bin/allsorts"
}
