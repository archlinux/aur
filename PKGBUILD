pkgname=merge-request-notifier
pkgver=1.7.0
pkgrel=1
pkgdesc="
This app shows your merge requests grouped by projects and WIP status. It is accessible from the system tray."
arch=('x86_64')
source=("https://github.com/codecentric/merge-request-notifier/releases/download/v${pkgver}/merge-request-notifier-${pkgver}.tar.xz"
	"https://raw.githubusercontent.com/codecentric/merge-request-notifier/master/build/icon.png"
	"merge-request-notifier.desktop")
sha256sums=('bd1827f0e65826859fae1b49f04ec292c86e1ed2b2f829b247e08aa6f231ddbf'
	'1b852a6efc5d806a73a7ea8ca0fc39f066da95063716ab53c564820860fe9fc0'
	'8d74ce91de6352aeb82d7d81ddafc8b730ce831804f55fa724de2174095d0ce6')

package() {
	install -Dm644 merge-request-notifier.desktop "${pkgdir}/usr/share/applications/merge-request-notifier.desktop"

        cd "${srcdir}"
        mkdir -p "${pkgdir}/opt/merge-request-notifier"
        mkdir -p "${pkgdir}/usr/bin"

	install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/0x0/apps/merge-request-notifier.png"
	cp -R merge-request-notifier-1.7.0/* "${pkgdir}/opt/merge-request-notifier"

	ln -sf /opt/merge-request-notifier/merge-request-notifier "${pkgdir}/usr/bin/merge-request-notifier"

	chmod -R go-w "${pkgdir}"
}

