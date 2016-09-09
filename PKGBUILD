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
source=("${pkgname}-${pkgver}.tar.gz::http://github.com/fbb-git/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('958497939d9f3d1c6d0e2e74f7592d5a98f9ddb6f95c50c1247e41600d2765b7')

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
