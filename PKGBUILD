# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: 	ston <ston dot jia at qq dot com>
pkgname=play-in-mpv
pkgver=1.0.4
pkgrel=2
pkgdesc='Play Bilibili video in mpv player.'
url='https://github.com/diannaojiang/Bilibili-Playin-Mpv'
arch=('x86_64')
license=('unknown')
depends=('xdg-utils' 'mpv' 'glibc' 'gcc-libs')
provides=(diannaojiang)
conflicts=("${pkgname}")
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/Bilibili-Playin-Mpv.v1.0.Linux.x86_64.zip"
	"playinmpv.desktop")
sha256sums=('681505428d5703f91c414dfd8e6aab45221c96e072853bdfece6eaafa4f7b461'
            '5a8e1888332c135219ac6bad9aa0f74042cd5f367191071818593a002bfb98e2')
package() {
	install -d "${pkgdir}/usr/bin/"
	install -d "${pkgdir}/usr/share/applications/"
	install -Dm755 "${srcdir}/playinmpv" "${pkgdir}/usr/bin/playinmpv"
	install -Dm644 "${srcdir}/playinmpv.desktop" -t "${pkgdir}/usr/share/applications"
}