# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>

pkgbase=mint-artwork-cinnamon
pkgname=cinnamon-sound-effects
pkgver=5.7
pkgrel=1
pkgdesc='Default artwork for the Cinnamon edition of Linux Mint.'
arch=('any')
license=('GPL')
depends=('cinnamon')
url='http://linuxmint.com'
source=("https://ftp.fau.de/mint/packages/pool/main/m/${pkgbase}/${pkgbase}_${pkgver}.tar.gz"
	"${pkgname}.gschema.override")
sha256sums=('9ba01cdd98d91b374663e719a7db2df72aa9a45e1e7373062a5db097b1952ffa'
	'657706bc266575b2756dc69a4e73cb48686fc164633c9bdc3ec55b9257ce1379')

package_cinnamon-sound-effects() {
	pkgdesc="Sound effects from ${pkgbase} package for the Cinnamon desktop."
	install="${pkgname}.install"
	optdepends=('mint-sounds: Linux Mint system sounds')

	cd "${srcdir}/${pkgbase}-${pkgver}"
	
	install -d "${pkgdir}/usr/share/${pkgbase}/sounds"
	for file in ./usr/share/${pkgbase}/sounds/*; do
		install -Dm644 "${file}" "${pkgdir}/usr/share/${pkgbase}/sounds/"
	done

	install -Dm644 "../${pkgname}.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/${pkgname}.gschema.override"
}
