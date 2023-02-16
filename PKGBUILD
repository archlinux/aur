# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=otf-daddytimemono
pkgdesc='A monospaced font for programmers and other terminal groupies'
pkgver=1.2.2
pkgrel=1
url=https://github.com/BourgeoisBear/DaddyTimeMono
license=(custom:OFL)
arch=(any)
makedepends=(fontforge)
conflicts=(otf-daddytimemono-git)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0ae8d5aebec40aaf478c6bc9df43ab42430ce792a2e1cf2cd280cb15e6c271027ae4f58342fb8e0b1a087f916a1ef42bb38fc7bab0b1b4c9591320e3e3b86105')

build () {
	cd "DaddyTimeMono-${pkgver}"
	fontforge -lang=ff \
		-c 'Open("DaddyTimeMono-ttf.sfd"); Generate("DaddyTimeMono.otf", "", 0x200080);'
}

package () {
	cd "DaddyTimeMono-${pkgver}"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" DaddyTimeMono.otf
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
