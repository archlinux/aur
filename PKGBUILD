# Maintainer: Kisuke-CZE <kisuke@kisuke.cz>
# Contributor: Shameempk <mailtoshameempk@gmail.com>
pkgname=polarr
pkgver=4.4.5
pkgrel=2
pkgdesc="Professional Photo Editing Tools for Everyone."
arch=('x86_64')
url="https://www.polarr.co"
license=('custom')
provides=('polarr')
depends=('gconf' 'vips')
source=("https://pickystore.blob.core.windows.net/models/${pkgname}_${pkgver}_amd64_xenial.deb")
sha256sums=('9c6e19bf770f68ca207ac8a4019fad252be05440b23d2d626ba1520a514442bf')

package() {
	tar xf ${srcdir}/data.tar.xz -C ${pkgdir}
	find ${pkgdir}/usr/ -type d -exec chmod 755 {} +
	find ${pkgdir}/usr/share/ -type f -exec chmod 644 {} +
	find ${pkgdir}/usr/lib/ -type f -exec chmod 644 {} +
	chmod 755 ${pkgdir}/usr/lib/polarr/polarr

	sed -i '/^\s*$/d' ${pkgdir}/usr/share/applications/polarr.desktop
	echo 'MimeType=image/jpeg;image/jpeg2000;image/bmp;image/gif;image/png;image/tiff;image/x-raw;' >> ${pkgdir}/usr/share/applications/polarr.desktop
}
