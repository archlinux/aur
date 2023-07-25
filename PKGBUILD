# Maintainer: fabillo <fabillo@archlinux.org>
pkgname="ripdrag"
pkgver="0.2.1"
pkgrel=1
pkgdesc="Drag and drop files to and from the terminal"
arch=(x86_64)
url="https://github.com/nik012003/ripdrag"
license=('GPL3')
depends=('gtk4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ae85bc12ac80600079bb57e650f34b1bafa26dc685567c0c73cf3c3595d564ab')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --frozen
}

check() {
	cd "$pkgname-$pkgver"
	./target/release/ripdrag -V
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/ripdrag" "$pkgdir/usr/bin/ripdrag"
}
