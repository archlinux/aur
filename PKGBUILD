# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=geforcenow-electron
_newpkgname=gfn-electron
pkgver=1.11.0
pkgrel=1
pkgdesc="Linux desktop client for GeForce NOW, using Electron"
arch=("armv7l" "i686" "x86_64")
url="https://github.com/hmlendea/${_newpkgname}"
license=('GPLv3')
depends=('libva')
source=("https://github.com/hmlendea/${pkgname}/releases/download/v${pkgver}/geforcenow-electron_${pkgver}_linux.zip"
	"https://raw.githubusercontent.com/hmlendea/geforcenow-electron/master/icon.png")
sha256sums=("67a4b86a2213f96a7359ff8702d759c1de5d9fb36267ee0d5e57647ac9e44a97"
	"582ad4bb073926e51d8acaa0ab81aa70a1dbe4736eda0cf130b6ae689982b7a0")

package() {
	install -d ${srcdir} ${pkgdir}/opt/${pkgname}
	install -d ${pkgdir}/usr/share/applications
	install -d ${pkgdir}/usr/share/pixmaps
	install -d ${pkgdir}/usr/bin

	cp -r ${srcdir}/* ${pkgdir}/opt/${pkgname}/
	ln -s /opt/${pkgname}/geforcenow-electron ${pkgdir}/usr/bin/geforcenow

	install -m644 ${srcdir}/icon.png ${pkgdir}/usr/share/pixmaps/nvidia.png
	install -m755 ${srcdir}/com.github.hmlendea.${pkgname}.desktop ${pkgdir}/usr/share/applications
}
