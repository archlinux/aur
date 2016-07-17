# Maintainer: Andrew Martin <amartin@avidandrew.com>

pkgname=photomatix
pkgver=1.0.0
pkgrel=2
pkgdesc="Professional HDR Creation Program"
url="http://hdrsoft.com/download/photomatix-linux.html"
arch=('x86_64')
license=('custom')
depends=('libtiff' 'openexr' 'gtkmm3')
source=("http://hdrsoft.com/download/linux/PhotomatixLinux_Ubuntu_16.04.deb")
sha1sums=('28a56527b8e2f463b96653a348034e7b1db02c93')
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
