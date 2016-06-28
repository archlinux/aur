# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>

pkgbase=mint-artwork-common
pkgname=mint-sounds
pkgver=2.0.5
pkgrel=1
pkgdesc='Common artwork used in Linux Mint.'
arch=('any')
license=('GPL')
url='http://linuxmint.com'
source=("https://ftp.fau.de/mint/packages/pool/main/m/${pkgbase}/${pkgbase}_${pkgver}.tar.gz"
	"${pkgname}.gschema.override")
sha256sums=('f6ac7710d032f062ed8c0dcf4668e77509d52ee3234e8b6bc4297cfe4de4e94d'
	'7535f178ef948cdc11a24dfa2d1a7e2ddb1b1b8d8e4be93f52fe286c536ae178')

package_mint-sounds() {
	pkgdesc="Linux Mint system sounds from ${pkgbase} package."
	install="${pkgname}.install"

	cd "${srcdir}/${pkgbase}"
	install -d "${pkgdir}/usr/share/sounds"
	cp -dr --no-preserve=ownership "./usr/share/sounds/LinuxMint" "${pkgdir}/usr/share/sounds/"
	install -Dm644 "../${pkgname}.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/${pkgname}.gschema.override"
}
