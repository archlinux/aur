# Maintainer: Dmitriy Q <krotesk-at-mail-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest-bin
_pkgname=ilorest
pkgver=7.0.0.0_20
pkgrel=2
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_0b881600776d472b948d163114&tab=releaseNotes"
depends=('bash' 'libxcrypt-compat' 'python')
makedepends=("python-pip")
conflicts=('ilorest')
provides=('ilorest')
groups=(hpproliant)
license=("HPE")
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v275538/RPMS/${arch}/${_pkgname}-${pkgver//_/-}.${arch}.rpm")
sha256sums=('5e23788e8c9b810d695dbd63607e9f4b961c4027eb8461b33e48240ebe8c8996')
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
