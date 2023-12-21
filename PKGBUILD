# Maintainer: Dmitriy Q <dmitry-at-atsip-dot-ru> 
# Contributor: Alexey Stukalov <astukalov-at-gmail-dot-com>

pkgname=ilorest
pkgver=4.7.0.0_24
pkgrel=1
pkgdesc="HPE RESTful Interface Tool"
arch=(x86_64)
url="https://support.hpe.com/connect/s/softwaredetails?language=en_US&softwareId=MTX_a718a30ca4a94396b64b331e00"
depends=('bash' 'libxcrypt-compat')
groups=(hpproliant)
license=("HPE")
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-linux/p1545251609/v239828/RPMS/$arch/$pkgname-${pkgver//_/-}.$arch.rpm")
sha256sums=('44a26ecb8f6ac06ca2e7f166206370308245c969a864ebb3f09c4b4d2c9201c3')
changelog=ChangeLog

package() {
	cp -a etc usr "$pkgdir"
	cd "${pkgdir}"
	mkdir usr/bin
	mv usr/sbin/* usr/bin
	rmdir usr/sbin
	mv usr/lib64 usr/lib
}
