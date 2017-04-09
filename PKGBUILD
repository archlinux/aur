# Maintainer: Nils Czernia <nils [at] czserver.de>

pkgname=snap7
pkgver=1.4.2
pkgrel=1
pkgdesc="Step7 Open Source Ethernet Communication Suite"
url="http://snap7.sourceforge.net/"
license=("LGPL3")
arch=('x86_64')
source=("https://downloads.sourceforge.net/project/snap7/${pkgver}/${pkgname}-full-${pkgver}.7z")
sha256sums=('65af129e11de4b0d942751bcd9c563f7012cae174931860c03dbb2cdf2e80ae7')

build() {
	cd "${srcdir}/${pkgname}-full-${pkgver}/build/unix/"
	make -f x86_64_linux.mk all
}

package() {
	cd "${srcdir}/${pkgname}-full-${pkgver}/build/"

	install -dm755 "${pkgdir}/usr/lib"
	install -dm755 "${pkgdir}/usr/include"

	cp -a bin/x86_64-linux/libsnap7.so "${pkgdir}/usr/lib/"
}
