# Maintainer: Sushant Ray <contact@neon.is-a.dev>

pkgname='sprofile'
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A tool for accessing your spotify statistics without ever leaving the terminal"
arch=('x86_64')
url="https://github.com/goodboyneon/sprofile"
license=('MIT')
depends=('nodejs>=18' 'rust' 'cargo')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/goodboyneon/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("d7c51b2d2de5fdb9153467386c55db89b070e2f6d27783805685c3ff796b565d")


build() {
	cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
