# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=mips32el-musl-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/mips32el/tarballs/mips32el--musl--bleeding-edge-2023.08-1.tar.bz2")
sha256sums=('d267cbc5ecb9e22bab2edd95450ae314f7d75d2eac34574f8df87d5778d8ae07')

build() {
	cd "mips32el--musl--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/mips32el-musl-bleeding-edge"
}

package() {
	options=(!strip)

	cd "mips32el--musl--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/mips32el-musl-bleeding-edge/"
	cp -a * "$pkgdir/opt/mips32el-musl-bleeding-edge/"
	rm -f "$pkgdir/opt/mips32el-musl-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"
}
