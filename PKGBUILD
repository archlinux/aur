# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>

pkgbase=mint-artwork-common
pkgname=mint-sounds
pkgver=2.1.8.1
pkgrel=1
pkgdesc='Common artwork used in Linux Mint.'
arch=('any')
license=('GPL')
url='http://linuxmint.com'
source=("https://ftp.fau.de/mint/packages/pool/main/m/${pkgbase}/${pkgbase}_${pkgver}.tar.gz"
	"${pkgname}.gschema.override")
sha256sums=('b3fae5391f87c909f66fb4aaa95dcbe53e521bbb37ab8784411bc620d2e5f5e8'
	'7535f178ef948cdc11a24dfa2d1a7e2ddb1b1b8d8e4be93f52fe286c536ae178')

package_mint-sounds() {
	pkgdesc="Linux Mint system sounds from ${pkgbase} package."
	install="${pkgname}.install"

	cd "${srcdir}/${pkgbase}-${pkgver}"
	install -d "${pkgdir}/usr/share/sounds"
	cp -dr --no-preserve=ownership "./usr/share/sounds/LinuxMint" "${pkgdir}/usr/share/sounds/"
	install -Dm644 "../${pkgname}.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/${pkgname}.gschema.override"
}
