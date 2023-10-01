# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=armv5-eabi-glibc-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2023.08-1.tar.bz2")
sha256sums=('79e017a9f7455a679eeb734c029cf17b32c62c30e85e39d48154645f2bef7f11')

build() {
	cd "armv5-eabi--glibc--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/armv5-eabi-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "armv5-eabi--glibc--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/armv5-eabi-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/armv5-eabi-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/armv5-eabi-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"
}
