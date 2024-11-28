# Maintainer: Ivan Saltz <archlinux@noisesoff.com>
# Contributors: Daniel Tihanyi <aur@tetragir.com>, Andrew Martin <amartin@avidandrew.com>

pkgname=photomatix
pkgver=2.0.1
pkgrel=2
pkgdesc="Professional HDR Creation Program"
url="http://hdrsoft.com/download/photomatix-linux.html"
arch=('x86_64')
license=('custom')
depends=('libtiff' 'openexr' 'gtkmm3')
source=("https://www.hdrsoft.com/download/linux/ubuntu/PhotomatixLinux2.0.1_Ubuntu23_24.deb")
sha1sums=('15c11d30d8ee459a5432e9031459ff633f2fe93e')
install="photomatix.install"

package() {
	# extract the deb file's data.tar.gz archive
	tar -x --zstd -f data.tar.zst -C "${srcdir}"

	install -d ${pkgdir}/usr/share
	mv ${srcdir}/usr/share/{applications,photomatix} ${pkgdir}/usr/share/
	chmod 755 ${pkgdir}/usr/share/applications

	install -d ${pkgdir}/usr/lib
	mv ${srcdir}/usr/lib/photomatix ${pkgdir}/usr/lib

	mv ${srcdir}/usr/bin ${pkgdir}/usr/
	chmod 755 ${pkgdir}/usr/bin
}
