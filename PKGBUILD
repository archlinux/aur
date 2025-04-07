# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest-bin
_pkgname=ilorest
pkgver=6.0.0.0_29
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
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v257664/RPMS/${arch}/${_pkgname}-${pkgver//_/-}.${arch}.rpm")
sha256sums=('878fb183bdc26d2406659c60261871dc7980d6a69bd0f130a7581259657ccd13')
changelog=ChangeLog

package() {
	DESTDIR=$pkgdir
 	cp -a etc usr $pkgdir
 	cd ${pkgdir}
 	#mkdir usr/bin
 	mv usr/sbin usr/bin
 	#rmdir usr/sbin
 	mv usr/lib64 usr/lib
 }
