# Maintainer: lain <aur@hacktheinter.net>
pkgname=eagle5
pkgver=5.12.0
pkgrel=1
pkgdesc="CadSoft EAGLE 5.x"
provides=("${pkgname}")
conflicts=()
arch=('i686' 'x86_64')
url='ftp://ftp.cadsoft.de/eagle/program/5.0'
sha256sums=('7903438b6f171894d7503d6b6e3149d3da321c386a86d1b05f1e08a3b924dafd')
license=('Proprietary')
depends=('libjpeg6-turbo' 'lib32-libjpeg6-turbo')
makedepends=()
source=('ftp://ftp.cadsoft.de/eagle/program/5.0/eagle-lin.run')

package() {
	chmod +x eagle-lin.run
	./eagle-lin.run "${pkgdir}/opt"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/eagle-${pkgver}/bin/eagle" "${pkgdir}/usr/bin/eagle-${pkgver}"
}

#eof

