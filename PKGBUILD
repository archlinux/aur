# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname=yodl
pkgver=3.08.01
pkgrel=1
pkgdesc='Implements a pre-document language and tools to process it.'
arch=('i686' 'x86_64')
url='https://fbb-git.github.io/yodl/'
license=('GPL3')
depends=('bash')
makedepends=('icmake>=8.00.00')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fbb-git/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a88ab79657661262f4ccce4fd307ba41a05bcefbb534a2b5ed84115ab592ddf3ce883747aad5c028e73142ec91815ee86e1ae16ab9d319fe2045a2b0a08ab42c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
	./build programs
	./build macros
	./build man
	./build html
}
package() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"
	./build install programs "${pkgdir}"
	./build install macros "${pkgdir}"
	./build install man "${pkgdir}"
	./build install manual "${pkgdir}"
}
