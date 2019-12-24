# Maintainer: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=2.4.1_14
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/hpsc/swd/public/detail?swItemId=MTX_f22538348b0d4bfbb421afa349"
depends=(bash)
groups=(hpproliant)
license=("CUSTOM")

source=("https://downloads.linux.hpe.com/SDR/repo/ilorest/current/$pkgname-${pkgver//_/-}.x86_64.rpm")
sha256sums=('d0b9481e8b1b1da2af3354714313065ef4d831cb5c6bfe879340fda7ed167313')

package() {
	cp -a etc usr "$pkgdir"
	cd "${pkgdir}"
	mkdir usr/bin
	mv usr/sbin/* usr/bin
	rmdir usr/sbin
	mv usr/lib64 usr/lib
}
