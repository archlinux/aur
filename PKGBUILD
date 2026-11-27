# Maintainer: Andras Biro <bbandi86@gmail.com>
pkgname=zoyi_gui
pkgver=0.1.4
pkgrel=1
pkgdesc="Desktop app for the ZOYI ZT703S and ZT706S scopemeters running OpenOSC firmware"
arch=(any)
url="https://github.com/fletto2/zoyi_gui"
license=('MIT')
depends=('qt6-base' 'qt6-serialport')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fletto2/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('df003d57ef4defe0fa99acff08b231a61284a75281f53b86ef7c46987ab0e36a')



build() {
	cd "${pkgname}-${pkgver}"
	make -f Makefile.linux
}


package() {
    install -Dm755 "${pkgname}-${pkgver}/build/linux/${pkgname}" -vt "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}/packaging/${pkgname}.png" -vt "${pkgdir}/usr/share/pixmaps/"
    install -Dm644 "${pkgname}-${pkgver}/packaging/${pkgname}.svg" -vt "${pkgdir}/usr/share/pixmaps/"
    install -Dm644 "${pkgname}-${pkgver}/packaging/${pkgname}.desktop" -vt "${pkgdir}/usr/share/applications"
}
