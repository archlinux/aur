# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>

pkgbase=mint-artwork-cinnamon
pkgname=cinnamon-sound-effects
pkgver=4.9
pkgrel=1
pkgdesc='Default artwork for the Cinnamon edition of Linux Mint.'
arch=('any')
license=('GPL')
depends=('cinnamon')
url="http://linuxmint.com"
source=("http://packages.linuxmint.com/pool/main/m/${pkgbase}/${pkgbase}_${pkgver}.tar.gz")
sha256sums=('4523f3043977f352309043350bfafc33d07dd3ac9e794e75c481e3733ac7a28c')

package_cinnamon-sound-effects() {
	pkgdesc="Sound effects from ${pkgbase} package for the Cinnamon desktop."
	install="${pkgname}.install"
	optdepends=('mint-sounds: Linux Mint system sounds')

	cd "${srcdir}/${pkgbase}"
	
	install -d "${pkgdir}/usr/share/${pkgbase}/sounds"
	for file in ./usr/share/${pkgbase}/sounds/*; do
		install -Dm644 "${file}" "${pkgdir}/usr/share/${pkgbase}/sounds/"
	done

	install -Dm644 "${startdir}/${pkgname}.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/${pkgname}.gschema.override"
}
