# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=websum-git
pkgver=0.2.1
pkgrel=1
pkgdesc="Next-gen integrity checker written in Rust"
arch=(x86_64)
url="https://github.com/yilmaz08/websum"
license=('MIT')
depends=()
options=('!lto')
makedepends=('git' 'cargo' 'binutils')
provides=(websum)
source=("git+$url")
sha256sums=('SKIP')

build() {
	cd $srcdir/websum
	cargo build --release --target-dir target
}

package() {
	cd $srcdir/websum
	install -Dm755 target/release/websum "${pkgdir}/usr/bin/websum"
}
