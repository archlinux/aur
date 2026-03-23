# Maintainer: Dmitriy Q <krotesk-at-mail-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest-bin
_pkgname=ilorest
pkgver=7.1.0.0_11
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_0b881600776d472b948d163114&tab=releaseNotes"
depends=('bash' 'libxcrypt-compat' 'python')
makedepends=("python-pip")
conflicts=('ilorest')
provides=('ilorest')
groups=(hpproliant)
license=("HPE")
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v279422/RPMS/${arch}/${_pkgname}-${pkgver//_/-}.${arch}.rpm")
sha256sums=('80c11feb2f08d00427ce939fcbdf9cba370918cb737455d52d649fcbefcecfad')
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
