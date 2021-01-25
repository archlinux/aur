# Maintainer: lain <aur@hacktheinter.net>
pkgname=eagle6
pkgver=6.6.0
pkgrel=1
pkgdesc="CadSoft EAGLE 6.x"
provides=("${pkgname}")
conflicts=()
arch=('i686' 'x86_64')
url='ftp://ftp.cadsoft.de/eagle/program/6.6'
sha256sums=('1dd8f59a4c6b3a741e4c5e7eaa88347b9c12be8076c7cbb3580541a55a42a254')
license=('Proprietary')
depends=(
	'libjpeg6-turbo'
	'lib32-libjpeg6-turbo'
	'lib32-openssl-1.0'
)
makedepends=()
source=('ftp://ftp.cadsoft.de/eagle/program/6.6/eagle-lin.run')

package() {
	chmod +x eagle-lin.run
	./eagle-lin.run "${pkgdir}/opt"
	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/opt/eagle-${pkgver}/bin/eagle" "${pkgdir}/usr/bin/eagle-${pkgver}"
}

#eof

