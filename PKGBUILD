# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=5.1.0.0_19
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_a718a30ca4a94396b64b331e00"
depends=('bash' 'libxcrypt-compat')
groups=(hpproliant)
license=("HPE")
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v247077/RPMS/$arch/$pkgname-${pkgver//_/-}.$arch.rpm")
sha256sums=('080437352b574e7b6a7c41ff169f6d217620e03839c3f55328ae82719084c914')
changelog=ChangeLog

package() {
	cp -a etc usr "$pkgdir"
	cd "${pkgdir}"
	mkdir usr/bin
	mv usr/sbin/* usr/bin
	rmdir usr/sbin
	mv usr/lib64 usr/lib
}
