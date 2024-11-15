# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest-bin
_pkgname=ilorest
pkgver=5.3.0.0_11
pkgrel=2
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_8b4b824586db4353bbfebe795f&tab=releaseNotes"
depends=('bash' 'libxcrypt-compat' 'python')
makedepends=("python-pip" "python-ilorest-library")
conflicts=('ilorest')
provides=('ilorest')
groups=(hpproliant)
license=("HPE")
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v254085/RPMS/${arch}/${_pkgname}-${pkgver//_/-}.${arch}.rpm")
sha256sums=('0137f868a90df1791f84af488a7238634d8a6d4f2f358cdb38d5acb1ff1cbb16')
changelog=ChangeLog

 package() {
 	cp -a etc usr "$pkgdir"
 	cd "${pkgdir}"
 	mkdir usr/bin
 	mv usr/sbin/* usr/bin
 	rmdir usr/sbin
 	mv usr/lib64 usr/lib
 }
