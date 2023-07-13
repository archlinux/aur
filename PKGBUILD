# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=4.2.0.0_20
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_11129264503941008c2b6bdf48"
depends=(bash)
groups=(hpproliant)
license=("CUSTOM")
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v226879/RPMS/$arch/$pkgname-${pkgver//_/-}.$arch.rpm")
sha256sums=('2285454eee5d564165700b75e6e8f29d23232d5bd7b8a5eeac18f12174492e35')
changelog=ChangeLog

package() {
	cp -a etc usr "$pkgdir"
	cd "${pkgdir}"
	mkdir usr/bin
	mv usr/sbin/* usr/bin
	rmdir usr/sbin
	mv usr/lib64 usr/lib
}
