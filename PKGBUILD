# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=com.seewo.easicamera
pkgver=2.0.0.602
pkgrel=1
pkgdesc="Seewo EasiCamera 视睿视频展台"
arch=('x86_64')
url=""
license=('')
groups=('')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/YidaozhanYa/seewo-uos-bin/releases/download/2/com.seewo.easicamera.tar.gz")
sha512sums=('abe38ffe18b03dcf19bdb3c51c9f902e706d7ee72ab10249fd56cd2fa41f61860194e2c69c996a268810c99dbd213e91be69432ad1b8347d9ad8cf3badd1f905')

package(){
	EASICAMERA_SRC="${srcdir}/com.seewo.easicamera"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/opt/apps/${pkgname}"
	cp -r "${EASICAMERA_SRC}" "${pkgdir}/opt/apps"
	install -D -m644 "${pkgdir}/opt/apps/${pkgname}/files/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	sed -i "1i\#!/usr/bin/bash" "${pkgdir}/opt/apps/${pkgname}/files/${pkgname}.sh"
	cp "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
