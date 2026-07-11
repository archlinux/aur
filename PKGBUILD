# Maintainer: Vitor Amaral <vitor.amaral10@gmail.com>
pkgname=8bitdo-xcloud-fix
pkgver=1.0.1
pkgrel=1
pkgdesc="Xbox 360 emulation (xboxdrv) for the 8BitDo Ultimate 2 — fixes button mapping and rumble on Xbox Cloud Gaming, Steam/Proton and emulators"
arch=('any')
url="https://github.com/vitoramaral10/8bitdo-xcloud-fix"
license=('MIT')
depends=('xboxdrv' 'systemd')
backup=('etc/8bitdo-xcloud.conf')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c492fd67966e21ba8290faedce2d6ffea3535d24c150d6fd2b19114b91d94933')

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
