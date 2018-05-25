# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
# Contributor: Ihor Kalnytskyi <ikalnytskyi at github dot com>

pkgname=termcolor-git
pkgver=0.1
pkgrel=1
epoch=
pkgdesc='Termcolor is a header-only C++ library for printing colored messages to the terminal. Written just for fun with a help of the Force.'
arch=('x86_64')
url='https://github.com/ikalnytskyi/termcolor'
license=('BSD')
groups=()
depends=()
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=('termcolor')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/ikalnytskyi/termcolor.git")
noextract=()
validpgpkeys=()
sha256sums=('SKIP')

prepare() {
	# cd "$pkgname
	:
}

build() {
	cd "${pkgname}"
	cmake .
	make
}

check() {
	cd "${pkgname}"
	./test_termcolor
}

package() {
	cd "${pkgname}"
	install -Dm644 "include/termcolor/termcolor.hpp" "${pkgdir}/usr/include/termcolor/termcolor.hpp"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
