# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=5.2.0.0_14
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_1225e57e3b4b4c4582f654f782&tab=releaseNotes"
depends=('bash' 'libxcrypt-compat')
groups=(hpproliant)
license=("HPE")
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v250631/RPMS/$arch/$pkgname-${pkgver//_/-}.$arch.rpm")
sha256sums=('0b3c8a73602bc493321d0bef01116e81ba01cc5a00fe154b6c9029d1de0a3043')
changelog=ChangeLog

package() {
	cp -a etc usr "$pkgdir"
	cd "${pkgdir}"
	mkdir usr/bin
	mv usr/sbin/* usr/bin
	rmdir usr/sbin
	mv usr/lib64 usr/lib
}
