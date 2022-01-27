# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

pkgname=terra-station-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Wallet for Terra Blockchain"
url="https://www.terra.money/"
arch=('x86_64')
license=('ISC')
depends=()
source=("https://github.com/terra-money/station-desktop/releases/download/v$pkgver/Terra.Station-$pkgver.x86_64.rpm")
sha256sums=('f5576c337a1041a965589201b4f7214c46988a36cafa5806a6dbedd8de60eaee')

package() {
	bsdtar -xf "${srcdir}/Terra.Station-$pkgver.x86_64.rpm"
	cp -r "${srcdir}/opt" "${pkgdir}/opt"
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	chmod 755 "${pkgdir}/opt"
	chmod 755 "${pkgdir}/usr"
	chmod +x "${pkgdir}/opt/Terra Station/station-electron"
}
