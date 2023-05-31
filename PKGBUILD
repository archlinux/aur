# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=2.5.1_9
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_f22538348b0d4bfbb421afa349"
depends=(bash)
groups=(hpproliant)
license=("CUSTOM")

source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v171063/RPMS/$arch/$pkgname-${pkgver//_/-}.$arch.rpm")
sha256sums=('49df41e85b18da45360014c5ea59c459649624be6ae7bc47cbcca75b4276887a')

package() {
	cp -a etc usr "$pkgdir"
	cd "${pkgdir}"
	mkdir usr/bin
	mv usr/sbin/* usr/bin
	rmdir usr/sbin
	mv usr/lib64 usr/lib
}
