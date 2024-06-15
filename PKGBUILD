# Maintainer: Sushant Ray <contact@neon.is-a.dev>

pkgname='sprofile'
pkgver=0.2.0
pkgrel=0
epoch=
pkgdesc="A tool for accessing your spotify statistics without ever leaving the terminal"
arch=('x86_64')
url="https://github.com/goodboyneon/sprofile"
license=('MIT')
depends=('nodejs>=18' 'rust' 'cargo')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/goodboyneon/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("453464c1b1a7d25bf4e75ea7222e5cf2aab766469adb0afab8d8f5d999ea50c6")


build() {
	cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
