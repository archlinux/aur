# Maintainer: Shameempk <mailtoshameempk@gmail.com>
pkgname=polarr
pkgver=4.0.0
pkgrel=2
pkgdesc="Professional Photo Editing Tools for Everyone."
arch=('x86_64')
url="https://www.polarr.co"
license=('custom')
provides=('polarr')
depends=('gconf')
source=("https://s3-us-west-2.amazonaws.com/polarrelectron/ubuntu/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('4357f0fcbe8b677dfb21e1c44879ff15e38c4eb0d04d1e35bbbba8c9d8a04058')

package() {
	tar xf ${srcdir}/data.tar.xz -C ${pkgdir}
	find ${pkgdir}/usr/ -type d -exec chmod 755 {} +
	find ${pkgdir}/usr/share/ -type f -exec chmod 644 {} +
	chmod 755 ${pkgdir}/usr/share/polarr/ppe

	sed -i '/^\s*$/d' ${pkgdir}/usr/share/applications/polarr.desktop
	echo 'MimeType=image/jpeg;image/jpeg2000;image/bmp;image/gif;image/png;image/tiff;image/x-raw;' >> ${pkgdir}/usr/share/applications/polarr.desktop
}
