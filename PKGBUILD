# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=4.3.0.0_16
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_39c4f47c37c746fc996e4b56a7"
depends=(bash)
groups=(hpproliant)
license=("HPE")
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v228483/RPMS/$arch/$pkgname-${pkgver//_/-}.$arch.rpm")
sha256sums=('0093d6ca94eea23fe947d32814493c2b68fe72a68bfcf82e143fdb0a57689f16')
changelog=ChangeLog

package() {
	cp -a etc usr "$pkgdir"
	cd "${pkgdir}"
	mkdir usr/bin
	mv usr/sbin/* usr/bin
	rmdir usr/sbin
	mv usr/lib64 usr/lib
}
