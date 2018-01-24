# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname=yodl
pkgver=4.02.00
pkgrel=1
pkgdesc='Implements a pre-document language and tools to process it.'
arch=('x86_64')
url='https://fbb-git.github.io/yodl/'
license=('GPL3')
depends=('bash')
makedepends=('icmake>=8.00.00')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fbb-git/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ca3a2490bf54a0ce4e800a62a3de9a5cf37df96f0f553de89623ef6d36f07b65b7c09168e77d267d7fb79d900a8e8a6c6d3c17c4b733345001213f5450c02b13')

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
