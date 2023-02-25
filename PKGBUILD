# Maintainer: Marcos Gutiérrez <margual56@gmail.com>
# Maintainer: Slimbook <dev@slimbook.es>

pkgname=slimbookservice-bin
pkgver=0.3.3
pkgrel=1
pkgdesc='Service to get desktop notifications from your device'
url='https://github.com/Slimbook-Team/slimbook_service'
license=(GPL3)
arch=(any)
depends=(python python-evdev python-pyzmq)
source=("https://github.com/Slimbook-Team/slimbook_service/releases/download/$pkgver/slimbook_$pkgver.tar.xz")
sha256sums=('841886bb517117e18413eb9d83adbd9c3a4bff7bc629950e7e0acba02bc99846')

package() {
	cd "${srcdir}/slimbook_${pkgver}"

	install -Dm755 "bin/slimbookindicator" -t "${pkgdir}/usr/bin/"
	install -D "etc/systemd/system/slimbook.service" -t "${pkgdir}/usr/lib/systemd/system/"

	cp -r "./usr/" "${pkgdir}/"

	install -Dm644 usr/share/slimbook/icons/*.svg -t "${pkgdir}/usr/share/pixmaps/"
	install -Dm644 usr/share/slimbook/*.desktop -t "${pkgdir}/usr/share/applications/"
}

