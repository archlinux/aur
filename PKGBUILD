# Maintainer: Justin Dray <justin@dray.be>
pkgname=lsiutil
pkgver=1.63
pkgrel=3
pkgdesc="Configuration utility for LSI MPT adapters (FC, SCSI, and SAS/SATA)"
url="http://http://karlsbakk.net/LSIUtil%20Kit%201.63/Source/"
arch=('x86_64' 'i686')
license=('none')
depends=(glibc)
source=("https://karlsbakk.net/LSIUtil%20Kit%20$pkgver/Source/lsiutil.tar.gz")

build() {
	cd "${srcdir}/${pkgname}"
	rm lsiutil
	gcc -Wall -O lsiutil.c -o lsiutil
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 lsiutil $pkgdir/usr/bin/lsiutil
}

sha512sums=('a6df71d7de8d5df3fa9632f52477e6f7790b6173e00aee090c590d95b5042e04bd3d85c567157b1d2f1da85035f6873ef35ce5601d78ac7c2a6e2ba195e6560a')
