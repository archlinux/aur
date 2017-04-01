# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=alert-after
pkgver=1.1.0
pkgrel=1
pkgdesc="Get a desktop notification after a command finishes executing"
arch=('i686' 'x86_64')
url="https://github.com/frewsxcv/alert-after"
license=('MIT' 'Apache')
depends=('dbus')
makedepends=('cargo')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('59cbbc5036534a549ea1bc89713ec6183eceedca6f58444c2458229fab910a2c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/aa" "$pkgdir/usr/bin/aa"
}
