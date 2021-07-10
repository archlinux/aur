# Maintainer: Jayvee Enaguas <harvettfox96@dismail.de>

pkgname=ttf-cherrybomb
pkgver=3.00
pkgrel=2
pkgdesc="A bubbly display font supports Latin and partial Japanese script."
arch=('any')
url="https://github.com/satsuyako/CherryBomb/"
license=('OFL-1.1')
source=("https://deb.debian.org/debian/pool/main/f/fonts-cherrybomb/fonts-cherrybomb_${pkgver}+dfsg.orig.tar.xz")
sha512sums=('5f6720cfff9dd299971aaad909f19ad3dd3c757bc175b652496ec2426fb96b34a6c939e3633673715774ab28644269280fb73d4d3898f3fb00a2f9bd84cbf79a')

prepare() {
	cd CherryBomb-ver${pkgver}/

	# Convert to Unix from DOS and remove trailing spaces.
	sed -ie 's#\r$##g;s#\s*$##g' OFL.txt
}

package() {
	cd CherryBomb-ver${pkgver}/

	install -d ${pkgdir}/usr/share/fonts/TTF/
	# Install TrueType font and licence files.
	install -Dm644 fonts/ttf/CherryBomb-Regular.ttf -t ${pkgdir}/usr/share/fonts/TTF/
	install -Dm644 OFL.txt -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
