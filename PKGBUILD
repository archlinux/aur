# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

pkgname=terra-station-bin
pkgver=3.5.0
pkgrel=1
pkgdesc="Web Application to interact with Terra Core"
url="https://www.terra.money/"
arch=('x86_64')
license=('Unlicensed')
depends=('electron')
source=("https://github.com/terra-money/station/releases/download/v$pkgver/station-electron-1.1.1.x86_64.rpm")
sha256sums=('f92f7de68f7fbd406908dca1b400be62bf4b00bdf67f08c9252e0a908dd42716')

package() {
	bsdtar -xf "${srcdir}/station-electron-1.1.1.x86_64.rpm"
	cp -r ${srcdir}/opt ${pkgdir}/opt
	cp -r ${srcdir}/usr ${pkgdir}/usr
	chmod 644 ${pkgdir}/opt
	chmod 644 ${pkgdir}/usr
	chmod +x "${pkgdir}/opt/Terra Station/station-electron"
}

