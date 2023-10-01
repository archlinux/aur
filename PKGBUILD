# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=aarch64-glibc-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--bleeding-edge-2023.08-1.tar.bz2")
sha256sums=('62094460b853970dcba91cae4314bfd1210bb2963be540f7b69be882f5f795ba')

build() {
	cd "aarch64--glibc--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/aarch64-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "aarch64--glibc--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/aarch64-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/aarch64-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/aarch64-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"
}
