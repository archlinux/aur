# Maintainer: surefire <surefire@cryptomile.net>

pkgname=skype-electron
pkgver=20160101
pkgrel=1
pkgdesc="An Electron Skype app designed for use on Linux systems"
arch=("any")
url="https://github.com/GyozaGuy/Skype-Electron"
license=("unknown")
depends=("electron" "hicolor-icon-theme")
_commit="5b75bd8496e25daa2b453864669840142be13347"
source=("https://github.com/GyozaGuy/Skype-Electron/archive/${_commit}.zip"
		"skype-electron.desktop"
		"skype-electron.sh")
md5sums=("3224f20f3c743a82f6f2836d73ba7281"
		"08c9dec95a58cc95f653844985fa5be2"
		"36f42eb8958a9468146b3169fdaef660")

install="skype-electron.install"

package() {

	install -Dm0644 "skype-electron.desktop" "${pkgdir}/usr/share/applications/skype-electron.desktop"
	install -Dm0755 "skype-electron.sh" "${pkgdir}/usr/bin/skype-electron"

	cd "Skype-Electron-${_commit}"

	install -dm0755 "${pkgdir}/usr/share/skype-electron"
	find -- -type f -exec install -Dm0644 '{}' "${pkgdir}/usr/share/skype-electron/{}" \;
	install -Dm0644 "images/app.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/skype-electron.png"

}
