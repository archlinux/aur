# Maintainer: Victor Bonnelle <victor.bonnelle@protonmail.com>

pkgname=ungit-electron
pkgver=1.5.21
pkgrel=0
pkgdesc="The easiest way to use git. On any platform. Anywhere. (Electron version)"
arch=('x86_64')
url='https://github.com/FredrikNoren/ungit'
license=('MIT')
conflicts=('ungit')
source=(
	"https://github.com/FredrikNoren/ungit/releases/download/v${pkgver}/ungit-${pkgver}-linux-x64.zip"
	'https://raw.githubusercontent.com/FredrikNoren/ungit/master/LICENSE.md'
)
md5sums=('SKIP' 'SKIP')

package() {
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mkdir -p "${pkgdir}/opt"
	cp -r ungit-linux-x64 "${pkgdir}/opt/${pkgname}"

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/ungit" "${pkgdir}/usr/bin/ungit"

	mkdir -p "${pkgdir}/usr/share/applications"
	install "${startdir}/ungit.desktop" "${pkgdir}/usr/share/applications/ungit.desktop"
}
