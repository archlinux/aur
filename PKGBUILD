# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: 	ston <ston dot jia at qq dot com>
pkgname=play-in-mpv
_pkgname=playinmpv
pkgver=1.0.4
pkgrel=4
pkgdesc='Play Bilibili video in mpv player.'
arch=('x86_64')
license=('custom')
url='https://github.com/diannaojiang/Bilibili-Playin-Mpv'
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
	'xdg-utils'
	'mpv'
)
options=(
	'!strip'
	'!emptydirs'
)
source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/Bilibili-Playin-Mpv.v1.0.Linux.${CARCH}.zip"
	"${pkgname}.desktop"
)
sha256sums=('681505428d5703f91c414dfd8e6aab45221c96e072853bdfece6eaafa4f7b461'
            '122d9406677c0917dfa66eef7e2c23edf9014b28aea7c7463f900dceeebe4e6c')
package() {
	install -d "${pkgdir}/usr/bin/"
	install -d "${pkgdir}/usr/share/applications/"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}