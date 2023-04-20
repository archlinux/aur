# Maintainer: Oleg Lazarevich <afaikiac at tuta dot io>

pkgname=pentablet
pkgver=3.2.3.230215
pkgrel=1
arch=('x86_64')
conflicts=('xp-pen-tablet')
pkgdesc="XP-Pen official Linux utility for graphic tablets"
url='https://www.xp-pen.com/download/index.html'
license=('LGPL3')
source=("XPPen-${pkgname}-${pkgver}-${pkgrel}.${arch}.tar.gz::https://www.xp-pen.com/download/file/id/1936/pid/440/ext/gz.html")
sha256sums=('e890d55c1d12a68647439ce7270e1e4c004d3ff0b901ec5a717145bd4a037722')

package() {
	cd "${srcdir}/xp-pen-${pkgname}-${pkgver}-${pkgrel}.${arch}"

	install -Dm644 App/usr/share/icons/pentablet.png \
		"${pkgdir}/usr/share/icons/pentablet.png"
	install -Dm644 App/usr/share/applications/xppentablet.desktop \
		"${pkgdir}/usr/share/applications/xppentablet.desktop"
	install -Dm644 App/etc/xdg/autostart/xppentablet.desktop \
		"${pkgdir}/etc/xdg/autostart/xppentablet.desktop"
	install -Dm644 App/lib/udev/rules.d/10-xp-pen.rules \
		"${pkgdir}/usr/lib/udev/rules.d/10-xp-pen.rules"
	install -dm755 "${pkgdir}/usr/lib/pentablet/conf/xppen"
	install -Dm644 App/usr/lib/pentablet/conf/xppen/* \
		"${pkgdir}/usr/lib/pentablet/conf/xppen/"
	install -dm755 "${pkgdir}/usr/lib/pentablet/lib"
	install -Dm755 App/usr/lib/pentablet/lib/* \
		"${pkgdir}/usr/lib/pentablet/lib/"
	install -dm755 "${pkgdir}/usr/lib/pentablet/platforms"
	install -Dm755 App/usr/lib/pentablet/platforms/* \
		"${pkgdir}/usr/lib/pentablet/platforms/"
	install -Dm644 App/usr/lib/pentablet/LGPL \
		"${pkgdir}/usr/lib/pentablet/LGPL"
	install -Dm755 \
		App/usr/lib/pentablet/pentablet \
		App/usr/lib/pentablet/pentablet.sh \
		App/usr/lib/pentablet/resource.rcc \
		"${pkgdir}/usr/lib/pentablet/"
}
