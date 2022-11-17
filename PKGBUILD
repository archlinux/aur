# Maintainer: Marcos Gutiérrez <margual56@gmail.com>
# Maintainer: Slimbook <dev@slimbook.es>

pkgname=slimbookservice
pkgver=0.3.1
pkgrel=2
pkgdesc='Service to get desktop notifications from your device'
url='https://github.com/Slimbook-Team/slimbook_service'
license=(GPL3)
arch=(any)
depends=(python python-evdev python-pyzmq)
source=("https://github.com/Slimbook-Team/slimbook_service/releases/download/$pkgver/slimbook_$pkgver.tar.xz")
sha256sums=('9e2e157d23d780feae975ee0ebe90fb3eb6af795495decfece575fb2205939c3')

package() {
	cd "${srcdir}/slimbook-${pkgver}"

	install -Dm755 "bin/slimbookindicator" -t "${pkgdir}/usr/bin/"
	install -D "etc/systemd/system/slimbook.service" -t "${pkgdir}/usr/lib/systemd/system/"

	cp -r "./usr/" "${pkgdir}/"

	ls "usr/share/slimbook/icons/"

	install -Dm644 usr/share/slimbook/icons/*.svg -t "${pkgdir}/usr/share/pixmaps/"
	install -Dm644 usr/share/slimbook/*.desktop -t "${pkgdir}/usr/share/applications/"
}

