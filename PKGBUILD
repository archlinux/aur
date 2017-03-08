# Maintainer: Daniel Chatfield <chatfielddaniel@gmail.com>
pkgname=trello-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Unofficial Trello Desktop app"
arch=(any)
url="https://github.com/danielchatfield/trello-desktop"
license=('MIT')
depends=()
makedepends=()
provides=("trello")
conflicts=("trello")
source=("https://github.com/danielchatfield/${pkgname%-bin}-desktop/releases/download/v0.1.1/Trello-linux-${pkgver}.zip"
		"trello.desktop"
		"trello.png")
md5sums=("11df848759cf7fe8fae9f87b07538750"
		 "c636a75cff12fb5f706c96fcf00d0ae9"
		 "ddf0e16e77fce510e2a67d6bdd16c433")

package() {
	cd "${srcdir}"

	msg2 'Adding binary'
	install -m755 -d "${pkgdir}/usr/bin"
	install -m755    "${srcdir}/Trello" "${pkgdir}/usr/bin/${pkgname%-bin}"

	msg2 'Adding application'
	install -m755 -d "${pkgdir}/usr/share/applications"
	install -m644    "${srcdir}/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/"

	msg2 'Adding pixmap'
	#convert "${srcdir}/resources/app/static/Icon.ico" "${srcdir}/../${pkgname%-bin}.png"
	install -m755 -d "${pkgdir}/usr/share/pixmaps"
	install -m644    "${srcdir}/${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps"
}
