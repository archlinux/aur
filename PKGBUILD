# Maintainer: Ivan Saltz <archlinux@noisesoff.com>
# Contributors: Daniel Tihanyi <aur@tetragir.com>, Andrew Martin <amartin@avidandrew.com>

pkgname=photomatix
pkgver=2.0.2
pkgrel=1
pkgdesc="Professional HDR Creation Program"
url="http://hdrsoft.com/download/photomatix-linux.html"
arch=('x86_64')
license=('custom')
depends=('libtiff' 'openexr' 'gtkmm3')
source=("https://www.hdrsoft.com/download/linux/ubuntu/PhotomatixLinux2.0.2_Ubuntu23_24.deb")
sha256sums=('5efdeb87a39b7d1a14c5285441b503ce72de63a7d432934cb8a0b1e4e0e71140')
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
