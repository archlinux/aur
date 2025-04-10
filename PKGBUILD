# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=ttf-plemoljp-bin
pkgver=2.0.4
pkgrel=1
pkgdesc='Plex Mono Language JP'
arch=('any')
url='https://github.com/yuru7/PlemolJP'
license=('custom:OFL')
provides=('ttf-font')
makedepends=()
conflicts=('ttf-plemoljp')
source=(
	"PlemolJP_v${pkgver}.zip::https://github.com/yuru7/PlemolJP/releases/download/v${pkgver}/PlemolJP_v${pkgver}.zip"
	"PlemolJP_NF_v${pkgver}.zip::https://github.com/yuru7/PlemolJP/releases/download/v${pkgver}/PlemolJP_NF_v${pkgver}.zip"
	"PlemolJP_HS_v${pkgver}.zip::https://github.com/yuru7/PlemolJP/releases/download/v${pkgver}/PlemolJP_HS_v${pkgver}.zip"
	"LICENSE::https://github.com/yuru7/PlemolJP/raw/v${pkgver}/LICENSE"
)
sha256sums=(
	'0bf19bd2a242e70582bb8c0be084c878e843f6aeaa9e00210828532285599757'
	'54fe7f4d2e857f43a13914ae38638a4205913b19feb3d2f80144c510f4a6a087'
	'df082e9274b7ce87d4db8d98c9dae0de4c92cfa84e8b795fc1a98a2e5b88333d'
	'52bbb5e729acc62435831d20641ece6a919e610100285ba183ef4d7233fb1e9a'
)

package() {
	find . -type f -name '*.ttf' -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/PlemolJP" \;
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
