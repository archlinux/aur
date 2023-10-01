# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=powerpc-440fp-glibc-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc-440fp/tarballs/powerpc-440fp--glibc--bleeding-edge-2023.08-1.tar.bz2")
sha256sums=('860e79fd5e3e65094e26af8c08273b5cb25b416ed33d95f0d30ce01751c61bc6')

build() {
	cd "powerpc-440fp--glibc--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/powerpc-440fp-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "powerpc-440fp--glibc--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/powerpc-440fp-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/powerpc-440fp-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/powerpc-440fp-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"
}
