# Maintainer: Dmitriy Q <krotesk-at-mail-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest-bin
_pkgname=ilorest
pkgver=7.3.0.0_7
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_300a25d73549410c892eacfeab&tab=releaseNotes"
depends=('bash' 'libxcrypt-compat' 'python')
makedepends=("python-pip")
conflicts=('ilorest')
provides=('ilorest')
groups=(hpproliant)
license=("HPE")
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v286363/RPMS/${arch}/${_pkgname}-${pkgver//_/-}.${arch}.rpm")
sha256sums=('60dc25957e62d6d844ea805f3e3986cd837e82c50d5dd9fdfb371fd0a18cc058')
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
