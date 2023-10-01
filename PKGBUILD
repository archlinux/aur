# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=aarch64-musl-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--musl--bleeding-edge-2023.08-1.tar.bz2")
sha256sums=('6e3f69eb9b85d8672805220c7af10bc7a761eb67504931b092d840dc4e1afa90')

build() {
	cd "aarch64--musl--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/aarch64-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "aarch64--musl--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/aarch64-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/aarch64-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/aarch64-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"
}
