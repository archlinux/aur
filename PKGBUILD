# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: 	ston <ston dot jia at qq dot com>
pkgname=play-in-mpv
_pkgname="${pkgname//-/}"
pkgver=1.0.4
pkgrel=5
pkgdesc='Play Bilibili video in mpv player.'
arch=('x86_64')
license=('unknown')
url='https://github.com/diannaojiang/Bilibili-Playin-Mpv'
provides=("${pkgname}=${pkgver}")
conflicts=(
	"${pkgname}"
	"${_pkgname}"
)
depends=(
	'xdg-utils'
	'mpv'
)
makedepends=(
	'gendesk'
)
options=(
	'!strip'
	'!emptydirs'
)
source=(
	"${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/Bilibili-Playin-Mpv.v1.0.Linux.${CARCH}.zip"
)
sha256sums=('681505428d5703f91c414dfd8e6aab45221c96e072853bdfece6eaafa4f7b461')
build() {
	gendesk -q -f -n --categories "AudioVideo" --name "${_appname}" --exec "${pkgname}"
}
package() {
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}