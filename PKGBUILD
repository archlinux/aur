# Maintainer: Th30 <ras-theo at monemail dot com>

pkgname=easyeffects-bundy01-presets
_origin=EasyEffects-Presets
pkgver=3.0
pkgrel=1
pkgdesc="Community Presets for Easyeffects: Bose, Music, Sony and Video"
arch=('any')
url="https://github.com/Bundy01/${_origin}"
license=('MIT')
depends=(
	easyeffects
	lsp-plugins-lv2
	mda.lv2
)
source=("${_origin}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3999680b0c2558042790d951a71e682db4cfabba542b25bcc9b2daf80353423a')

package()
{
	printf "\033[1;33m>>> The zam-plugins-lv2 dependency is no longer required for this package.\n>>> You can remove it using <pacman -Rsn zam-plugins-lv2>\033[0m\n"

	cd "${_origin}-${pkgver}"
	install -dm755 "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Bose.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Music.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Sony.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -m644 Video.json "${pkgdir}/usr/share/easyeffects/output/Bundy01-Presets"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
