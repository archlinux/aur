# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=alert-after
pkgver=1.3.0
pkgrel=1
pkgdesc="Get a desktop notification after a command finishes executing"
arch=('i686' 'x86_64')
url="https://github.com/frewsxcv/alert-after"
license=('MIT' 'Apache')
depends=('dbus')
makedepends=('cargo')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('752f2fa82dfe09f4e711347e4c33feb35ca410810a21aec29f08aaf2bb39874b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/aa" "$pkgdir/usr/bin/aa"
}
