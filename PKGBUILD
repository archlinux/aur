# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=allsorts-tools
pkgver=0.3.0
pkgrel=1
pkgdesc='Font debugging tools based on the allsorts font shaping engine'
arch=('i686' 'x86_64')
url="https://github.com/yeslogic/allsorts-tools"
license=('Apache')
depends=()
conflicts=('allsorts-tools-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c24f6367956f1e47cbe2575425b412c444ce4fb45c48e9ab454751d39a3ed567')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/allsorts" "$pkgdir/usr/bin/allsorts"
}
