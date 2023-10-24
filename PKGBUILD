# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=4.6.0.0_11
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_06c2f88e74324dd497715e01e1"
depends=('bash' 'libxcrypt-compat')
groups=(hpproliant)
license=("HPE")
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v235062/RPMS/$arch/$pkgname-${pkgver//_/-}.$arch.rpm")
sha256sums=('a99ddc6b7f69ea38ac61f8a3bbde1d4b18225a98a0b41158bbb34060b8207b10')
changelog=ChangeLog

package() {
	cp -a etc usr "$pkgdir"
	cd "${pkgdir}"
	mkdir usr/bin
	mv usr/sbin/* usr/bin
	rmdir usr/sbin
	mv usr/lib64 usr/lib
}
