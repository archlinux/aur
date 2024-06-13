# Maintainer: Sushant Ray <contact@neon.is-a.dev>

pkgname='sprofile'
pkgver=0.1.1
pkgrel=2
epoch=
pkgdesc="A tool for accessing your spotify statistics without ever leaving the terminal"
arch=('x86_64')
url="https://github.com/goodboyneon/sprofile"
license=('MIT')
depends=('nodejs>=18' 'rust' 'cargo')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/goodboyneon/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=("187c5b80cd94f1740c5fa7588a34a398dd4d71e8eb9218a76fc693927c967894")


build() {
	cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
