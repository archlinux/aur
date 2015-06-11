# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname=yodl
pkgver=3.05.00
pkgrel=1
pkgdesc="Implements a pre-document language and tools to process it."
arch=('i686' 'x86_64')
url="http://yodl.sourceforge.net"
license=('GPL3')
depends=('bash')
makedepends=('icmake')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}_${pkgver}.orig.tar.gz")
sha512sums=('45eccfb59853f57ffe2219b6de26e9851a28c59049b6165cc5dbd7201b5078b5930a286c0b2c61f534483b80f7c8c5de79925784ac6c29843d8c3842b508f7a8')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./build programs
	./build macros
	./build man
}
package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./build install programs "${pkgdir}"
	./build install macros "${pkgdir}"
	./build install man "${pkgdir}"
}
