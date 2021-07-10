# Maintainer: Jayvee Enaguas <harvettfox96@dismail.de>

pkgname=otf-lemonada
pkgver=4.004
pkgrel=1
pkgdesc="Modern Arabic and Latin typeface family"
arch=('any')
url="https://github.com/Gue3bara/Lemonada/"
license=('OFL-1.1')
source=("lemonada-${pkgver}.tar.gz::https://github.com/Gue3bara/Lemonada/archive/v4.004.tar.gz")
sha512sums=('d621028ecf339458e9e7065f593a92648c935d64318c55da6ba28f0f79f7207d52a1205abda7d932c1f2b2841593ba9fbd8640ef25379dedbd97c0b37398a643')

prepare() {
	cd Lemonada-${pkgver}/

	# Convert to Unix from DOS and remove trailing spaces.
	sed -ie 's#\r$##g;s#\s*$##g' OFL.txt
}

package() {
	cd Lemonada-${pkgver}/

	install -d ${pkgdir}/usr/share/fonts/OTF/
	# Install OpenType font and licence files.
	install -Dm644 fonts/otf/Lemonada-*.otf -t ${pkgdir}/usr/share/fonts/OTF/
	install -Dm644 OFL.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
