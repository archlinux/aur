# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Echizen Ryoma <echizenryoma.zhang@gmail.com>

pkgname=mint-artwork-cinnamon
pkgver=5.7
pkgrel=1
pkgdesc='Default artwork for the Cinnamon edition of Linux Mint.'
arch=('any')
license=('GPL')
depends=(
	'cinnamon'
)
url='http://linuxmint.com'
source=(
	"https://ftp.fau.de/mint/packages/pool/main/m/${pkgname}/${pkgname}_${pkgver}.tar.gz"
	"${pkgname}.gschema.override"
)
sha256sums=(
	'9ba01cdd98d91b374663e719a7db2df72aa9a45e1e7373062a5db097b1952ffa'
	'5923cc1f0b6e18a672bb63022e394dbf2ab72e95a2f3f9ac05c0d6944b17d4e4'
)

package() {
	pkgdesc="Sound effects from ${pkgname} package for the Cinnamon desktop."
	install="${pkgname}.install"

	cd "${srcdir}/${pkgbase}-${pkgver}"

	install -d "${pkgdir}/usr/share/${pkgbase}/sounds"
	for file in ./usr/share/${pkgbase}/sounds/*; do
		install -Dm644 "${file}" "${pkgdir}/usr/share/${pkgbase}/sounds/"
	done

	install -Dm644 "../${pkgname}.gschema.override" "${pkgdir}/usr/share/glib-2.0/schemas/${pkgname}.gschema.override"
}
