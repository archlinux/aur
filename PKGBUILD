# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=com.seewo.easirecorder
pkgver=1.0.0.778
pkgrel=1
pkgdesc="Seewo EasiRecorder 轻录播"
arch=('x86_64')
url=""
license=('')
groups=('')
depends=('patch' 'systemd' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libxss' 'libxtst' 'nss' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://github.com/YidaozhanYa/seewo-uos-bin/releases/download/2/com.seewo.easirecorder.tar.gz" "https://raw.githubusercontent.com/YidaozhanYa/seewo-uos-bin/main/run_easirecorder_mod.sh")
sha512sums=('249421063e7d195da1a930f008ed4c47a1fe1dad600c15d339d4c6d036e895d5d449eb9be49a0bf4fdde0cfdd4c5109df7a1cb8b3e261eac14396ba0142d95dd' 'fcb5b4107246842c96670073794086e46317b6a642926e694488a482ab408fbde4fc39e6e9078737b33527cd7b2ed39b6f8a3d921bfe3bffc8c8fd95d35f1b17')

package(){
	EASIREC_SRC="${srcdir}/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/opt/apps/${pkgname}"
	mkdir -p "${pkgdir}/etc/udev/rules.d/"
	cp -r "${EASIREC_SRC}" "${pkgdir}/opt/apps"
	install -D -m644 "${pkgdir}/opt/apps/${pkgname}/files/50-cvtmcu.rules" "${pkgdir}/etc/udev/rules.d/50-cvtmcu.rules"
	#sed -i "1i\#!/usr/bin/bash" "${pkgdir}/opt/apps/${pkgname}/files/${pkgname}.sh"
	cp -f "${srcdir}/run_easirecorder_mod.sh" "${pkgdir}/opt/apps/${pkgname}/files/run_easirecorder.sh"
	cp "${pkgdir}/opt/apps/${pkgname}/entries/applications/EasiRecorder.desktop" "${pkgdir}/usr/share/applications/EasiRecorder.desktop"
}
