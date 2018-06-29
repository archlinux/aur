# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname=yodl
pkgver=4.02.01
pkgrel=1
pkgdesc='Implements a pre-document language and tools to process it.'
arch=('x86_64')
url='https://fbb-git.gitlab.io/yodl/'
license=('GPL3')
depends=('bash')
makedepends=('icmake>=8.00.00')
source=("https://gitlab.com/fbb-git/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('59e23bb173786b8806f56bf302dee9d8d971d0d840c609e2b24d9783b5866fca2509be844616318f9a4f302117b3a41f620be5cba09181e7ccdcf0c141402be7')

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
