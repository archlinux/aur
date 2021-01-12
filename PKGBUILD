# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=persway
pkgver=0.4.0
pkgrel=1
pkgdesc="Small Sway IPC Daemon"
url="https://github.com/johnae/persway"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/johnae/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('0432c7b244dc865dbc697fb0dcd619edaf63797b744f28439fdcaf997cd88b68d35118209a505bf22b4fd630e0b4b1aaf63d2072be414545896650cd59c36277')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

