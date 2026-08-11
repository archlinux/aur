# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=ttf-plemoljp-bin
pkgver=3.1.0
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
	'f1a65b539ed8979f211ceaa6c7ad1123b7e0cc2eb00ab0df02fb2dcb0d6e7157'
	'015142b7ce4fb497ea6eb14567c435b69450eb5028fb7d29c032d1ffb3854abb'
	'3da6bafa30bd51bd6a7ab9c2cadc21b005565f4af5099df02b54e6eb5c9caf85'
	'52bbb5e729acc62435831d20641ece6a919e610100285ba183ef4d7233fb1e9a'
)

package() {
	find . -type f -name '*.ttf' -exec install -Dm644 {} -t "${pkgdir}/usr/share/fonts/PlemolJP" \;
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
