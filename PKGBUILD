# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=aarch64be-musl-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64be/tarballs/aarch64be--musl--bleeding-edge-2023.08-1.tar.bz2")
sha256sums=('b2b30d563559664d0efc23eb00bc469c808bdfd400198967ba1255863301efc0')

build() {
	cd "aarch64be--musl--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/aarch64be-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "aarch64be--musl--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/aarch64be-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/aarch64be-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/aarch64be-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"
}
