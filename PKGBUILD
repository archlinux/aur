# Maintainer: Andrew Martin <amartin@avidandrew.com>

pkgname=photomatix
pkgver=1.0.1
pkgrel=2
pkgdesc="Professional HDR Creation Program"
url="http://hdrsoft.com/download/photomatix-linux.html"
arch=('x86_64')
license=('custom')
depends=('libtiff' 'openexr' 'gtkmm3')
source=("https://hdrsoft.com/download/linux/PhotomatixLinux1.0.1_Ubuntu16.04.deb")
sha1sums=('7331eab255f114f550c5726ce6235198fc8d19ad')
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
