# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=s390x-z13-glibc-bleeding-edge-toolchain
pkgver=2023.08
pkgrel=1
pkgdesc="Ready-to-use cross-compilation toolchain provided by bootlin.com"
arch=("x86_64")
url="https://toolchains.bootlin.com/"
license=("GPL")
source=("https://toolchains.bootlin.com/downloads/releases/toolchains/s390x-z13/tarballs/s390x-z13--glibc--bleeding-edge-2023.08-1.tar.bz2")
sha256sums=('38edb78e044ce8c47214452084d5ce38c8b94a2484b296972a764da701ca738a')

build() {
	cd "s390x-z13--glibc--bleeding-edge-2023.08-1"

	sh relocate-sdk.sh "/opt/s390x-z13-glibc-bleeding-edge"
}

package() {
	options=(!strip)

	cd "s390x-z13--glibc--bleeding-edge-2023.08-1"

	mkdir -p "$pkgdir/opt/s390x-z13-glibc-bleeding-edge/"
	cp -a * "$pkgdir/opt/s390x-z13-glibc-bleeding-edge/"
	rm -f "$pkgdir/opt/s390x-z13-glibc-bleeding-edge/{buildroot.config,relocate-sdk.sh,summary.csv,share/buildroot/sdk-location}"
}
