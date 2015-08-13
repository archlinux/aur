# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>

pkgbase=mint-artwork-common
pkgname=mint-sounds
pkgver=1.8.7
pkgrel=1
pkgdesc='Common artwork used in Linux Mint.'
arch=('any')
license=('GPL')
url="http://linuxmint.com"
source=("http://packages.linuxmint.com/pool/main/m/${pkgbase}/${pkgbase}_${pkgver}.tar.gz")
sha256sums=('8799797e533abae36602254568a0496a5bdf04346455ad642826a8631af23143')

package_mint-sounds() {
	pkgdesc="Linux Mint system sounds from ${pkgbase} package."
	install="${pkgname}.install"

	cd "${srcdir}/${pkgbase}-${pkgver}"
	install -d "${pkgdir}/usr/share/sounds/LinuxMint"
	find "./usr/share/sounds/LinuxMint" -type f -exec install -Dm644 {} "${pkgdir}/usr/share/sounds/LinuxMint/" \;
	install -Dm644 "${startdir}/${pkgname}.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/${pkgname}.gschema.override"
}
