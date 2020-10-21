# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Manuel Hüsers <aur@huesers.de>

pkgbase=mint-artwork-common
pkgname=mint-sounds
pkgver=2.1.8.2
pkgrel=1
pkgdesc='Common artwork used in Linux Mint.'
arch=('any')
license=('GPL')
url='http://linuxmint.com'
source=("https://ftp.fau.de/mint/packages/pool/main/m/${pkgbase}/${pkgbase}_${pkgver}.tar.gz"
	"${pkgname}.gschema.override")
sha256sums=('cb4d1a42d9e9c9fecd1b8aaa9ed8c4614b64236e6aa9da26c3a293e485e51ff9'
	'7535f178ef948cdc11a24dfa2d1a7e2ddb1b1b8d8e4be93f52fe286c536ae178')

package_mint-sounds() {
	pkgdesc="Linux Mint system sounds from ${pkgbase} package."
	install="${pkgname}.install"

	cd "${srcdir}/${pkgbase}-${pkgver}"
	install -d "${pkgdir}/usr/share/sounds"
	cp -dr --no-preserve=ownership "./usr/share/sounds/LinuxMint" "${pkgdir}/usr/share/sounds/"
	install -Dm644 "../${pkgname}.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/${pkgname}.gschema.override"
}
