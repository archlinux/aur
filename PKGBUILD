# Maintainer: Robin Appelman <robin@icewind.nl>

pkgname=persway
pkgver=0.3.5
pkgrel=1
pkgdesc="Small Sway IPC Daemon"
url="https://github.com/johnae/persway"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/johnae/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('0932ba8bf53939fdb76378e5ddfdef71ac571f3d9b231e8bffc97f830a73f9e32bfcf664ae91addea7f8900f5ad93f9430b44bf87fcc1f007165fab2804603b9')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --target-dir "./target"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

