# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=libnfd
pkgver=116
pkgrel=2
pkgdesc="A tiny, neat C library that portably invokes native file open and save dialogs."
arch=('any')
url="https://github.com/mlabbe/nativefiledialog"
makedepends=('gtk3')
license=('GPL')
source=("https://github.com/mlabbe/nativefiledialog/archive/refs/tags/release_${pkgver}.tar.gz")
sha256sums=('1bbaed79b9c499c8d2a54f40f89277e721c0894bf3048bb247d826b96db6bc08')

build() {
	cd "nativefiledialog-release_${pkgver}/build/gmake_linux/"
	make
}

package() {
	cd "nativefiledialog-release_${pkgver}"
	install -Dm644 "build/lib/Release/x64/libnfd.a" "${pkgdir}/usr/lib/nfd/libnfd.a"
	install -Dm644 "src/include/nfd.h" "${pkgdir}/usr/include/nfd/nfd.h"
}
