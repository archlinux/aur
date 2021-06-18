# Maintainer: Morganamilo <morganamilo@gmail.com>

pkgname=pep8-asm-git
_pkgname=pep8
pkgver=8.3.r0.g1fd697c
pkgrel=1
epoch=1
pkgdesc="Pep/8 assembler and simulator"
arch=("x86_64")
url="http://computersystemsbook.com/4th-edition/pep8/"
license=('GPL3')
depends=('qt5-base' 'qt5-webengine')
makedepends=('git')
provides=('pep8-asm')
conflicts=('pep8-asm')
source=("git+https://github.com/StanWarford/${_pkgname}")
md5sums=('SKIP')

build() {
	cd "${_pkgname}"
	qmake pep8.pro
	make
}

package() {
	cd "${_pkgname}"
	install -Dm755 Pep8 "${pkgdir}/usr/bin/pep8"
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
