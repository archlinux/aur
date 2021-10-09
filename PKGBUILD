# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=com.seewo.easicare
pkgver=2.0.12
pkgrel=1
pkgdesc="Seewo EasiCare 班级优化大师"
arch=('x86_64')
url=""
license=('')
groups=('')
depends=('desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/YidaozhanYa/seewo-uos-bin/releases/download/2/com.seewo.easicare.tar.gz")
sha512sums=('1e06c2be5d2e206ec96ed7d499a1aadcc3b6dba432fb2d1d9601360167acd86800d6d5d5cf245e0f52151ad83ad01d90221a2423a82d5604e8e21971be377e3d')

package(){
	EASICARE_SRC="${srcdir}/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/opt/apps/${pkgname}"
	cp -r "${EASICARE_SRC}" "${pkgdir}/opt/apps"
	install -D -m644 "${pkgdir}/opt/apps/${pkgname}/files/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	sed -i "1i\#!/usr/bin/bash" "${pkgdir}/opt/apps/${pkgname}/files/${pkgname}.sh"
	cp "${pkgdir}/opt/apps/${pkgname}/entries/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
