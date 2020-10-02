# Maintainer: Ivan Saltz <archlinux@noisesoff.com>
# Contributors: Daniel Tihanyi <aur@tetragir.com>, Andrew Martin <amartin@avidandrew.com>

pkgname=photomatix
pkgver=2.0.1
pkgrel=1
pkgdesc="Professional HDR Creation Program"
url="http://hdrsoft.com/download/photomatix-linux.html"
arch=('x86_64')
license=('custom')
depends=('libtiff' 'openexr' 'gtkmm3')
source=("https://hdrsoft.com/download/linux/ubuntu/PhotomatixLinux2.0.1_Ubuntu20.04.deb")
sha1sums=('ab13a236b1036c3ddef333b3af0d04489ba14b17')
install="photomatix.install"

package() {
	# extract the deb file's data.tar.gz archive
	tar -xJf data.tar.xz -C "${srcdir}"

	install -d ${pkgdir}/usr/share
	mv ${srcdir}/usr/share/{applications,photomatix} ${pkgdir}/usr/share/
	chmod 755 ${pkgdir}/usr/share/applications

	install -d ${pkgdir}/usr/lib
	mv ${srcdir}/usr/lib/photomatix ${pkgdir}/usr/lib

	mv ${srcdir}/usr/bin ${pkgdir}/usr/
	chmod 755 ${pkgdir}/usr/bin
}
