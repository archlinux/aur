# Maintainer: Kaleb Klein <klein.jae@gmail.com>

pkgname=swgemu
pkgver=0.18
pkgrel=4
pkgdesc="Launcher for Star Wars Galaxies Emulator"
arch=(any)
license=('GPL')
url="http://www.swgemu.com"
_dlurl=http://launchpad2.net/SWGEmuLaunchpad_ubuntu_x86_64.tar.gz
depends=('qt5-base','qt5-webkit')
source=(launchpad launchpad.desktop launchpad.install icon.png ${_dlurl})
md5sums=('b7041ff9bef465687f6df5a6fb9053db'
         '3d5fff82e58d1a1ff548f72a0cb466ea'
         '4a855d869afa0fe7eb21bb1beb015b0a'
         '4df75531fbf01652c5ac53d4d7978187'
         'c1fbbcef48ba61ea3c17692a19084c62')
install='launchpad.install'

package() {
	cd "$srcdir"

	install -D -m755 "${srcdir}/launchpad" "${pkgdir}/usr/bin/launch-swg"
	install -D -m644 "${srcdir}/ubuntu64/KSWGProfCalc.dat" "${pkgdir}/opt/SWGEMU/Launchpad/KSWGProfCalc.dat"
	install -D -m644 "${srcdir}/ubuntu64/KSWGProfCalcEditor.exe" "${pkgdir}/opt/SWGEMU/Launchpad/KSWGProfCalcEditor.exe"
	install -D -m644 "${srcdir}/ubuntu64/SWGEmuLaunchpad" "${pkgdir}/opt/SWGEMU/Launchpad/SWGEmuLaunchpad"
	chmod +x "${pkgdir}/opt/SWGEMU/Launchpad/SWGEmuLaunchpad"

	install -D -m644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/SWGEMU/icon.png"
	install -D -m644 "${srcdir}/launchpad.desktop" "${pkgdir}/usr/share/applications/launchpad.desktop"
}
