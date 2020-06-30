# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=allsorts-tools
pkgver=0.4.0
pkgrel=2
pkgdesc='Font debugging tools based on the allsorts font shaping engine'
arch=('i686' 'x86_64')
url="https://github.com/yeslogic/allsorts-tools"
license=('Apache')
depends=()
conflicts=('allsorts-tools-git')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('93c32dd0ce7fbef23a48e08d258977b4d2d06ffa8d26ac08585adf2e6bd62896')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/allsorts" "$pkgdir/usr/bin/allsorts"
}
