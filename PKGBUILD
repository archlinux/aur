# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>

pkgbase=mint-artwork-cinnamon
pkgname=cinnamon-sound-effects
pkgver=5.0
pkgrel=1
pkgdesc='Default artwork for the Cinnamon edition of Linux Mint.'
arch=('any')
license=('GPL')
depends=('cinnamon')
url='http://linuxmint.com'
source=("https://ftp.fau.de/mint/packages/pool/main/m/${pkgbase}/${pkgbase}_${pkgver}.tar.gz"
	"${pkgname}.gschema.override")
sha256sums=('9071e5e3d73e48c902c8e9c21f00fce903a5f2ef6c35a2187803d3492a0b9ef2'
	'ca9d9d22c2ca9b0e257f93bd624fc27a53cab258797e009438a82e9b6902100e')

package_cinnamon-sound-effects() {
	pkgdesc="Sound effects from ${pkgbase} package for the Cinnamon desktop."
	install="${pkgname}.install"
	optdepends=('mint-sounds: Linux Mint system sounds')

	cd "${srcdir}/${pkgbase}"
	
	install -d "${pkgdir}/usr/share/${pkgbase}/sounds"
	for file in ./usr/share/${pkgbase}/sounds/*; do
		install -Dm644 "${file}" "${pkgdir}/usr/share/${pkgbase}/sounds/"
	done

	install -Dm644 "../${pkgname}.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/${pkgname}.gschema.override"
}
