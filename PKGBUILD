# Maintainer: Justin Dray <justin@dray.be>
pkgname=lsiutil
pkgver=1.72
pkgrel=2
pkgdesc="Configuration utility for LSI MPT adapters (FC, SCSI, and SAS/SATA)"
url="http://http://karlsbakk.net/LSIUtil%20Kit%201.63/Source/"
arch=('x86_64' 'i686')
license=('none')
depends=(glibc)
source=("https://ftp.icm.edu.pl/packages/LSI/sw/lsiutil-$pkgver.tar.gz")

build() {
	cd "${srcdir}/${pkgname}"
	gcc $CFLAGS -Wall -O lsiutil.c -o lsiutil
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 lsiutil $pkgdir/usr/bin/lsiutil
}

sha512sums=('bd89b0f4d91a867c7433d948fb6311af4933994e9bda5d688c32c9b8342138557c278e8f7b8b7c595f683a4da5495d4791f0f10ed95ef741647039d9b5b6665b')
