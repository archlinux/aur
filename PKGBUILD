# Maintainer: Daniel Garcia-Briseno <daniel@dangarbri.tech>
pkgname=prodinfo-git
name=prodinfo
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for getting product information. Info is returned in JSON and printed to the console."
arch=("any")
url="https://github.com/dangarbri/prodinfo"
license=('MIT')
makedepends=("rust")
source=("git+https://github.com/dangarbri/prodinfo")
md5sums=("SKIP")

build() {
	cd $name
    cargo build --release
}

package() {
	cd "$name"
	install -Dm755 target/release/prodinfo $pkgdir/usr/bin/prodinfo
}
