# Maintainer: Sushant Ray <contact@neon.is-a.dev>

pkgname='sprofile'
pkgver=0.1.0
pkgrel=2
epoch=
pkgdesc="A tool for accessing your spotify statistics without ever leaving the terminal"
arch=('x86_64')
url="https://github.com/goodboyneon/sprofile"
license=('MIT')
depends=('nodejs>=18' 'rust' 'cargo')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/goodboyneon/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("1f39737b71833f23ae75ae3637a7421b0ada7bf1452d39900083d23d6b200620")


build() {
	cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
