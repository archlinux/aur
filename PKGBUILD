# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=powerpc-440fp-musl-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--musl--bleeding-edge-2023.08-1.tar.bz2")
sha256sums=('bb55c1a0b4cce5ea40b6fbbd81259bb295c31e71e150dfd4df8f27add4fd75fb')

build() {
	cd "powerpc-440fp--musl--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/powerpc-440fp-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "powerpc-440fp--musl--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/powerpc-440fp-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/powerpc-440fp-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/powerpc-440fp-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"
}
