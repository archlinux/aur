# Maintainer: Marcos Gutiérrez Alonso <margual56@gmail.com>

pkgname=minesweeper-cli-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Command Line version of MineSweeper for Unix-like systems"
arch=('i686' 'x86_64')
url="https://github.com/unknownblueguy6/MineSweeper"
license=('MIT')

depends=()
makedepends=('gcc')
checkdepends=()
optdepends=()

source=("MineSweeper::git+${url}.git")
noextract=()
md5sums=('SKIP')

prepare() {
	mv "./MineSweeper" "./${pkgname}"	
	mkdir -p "${pkgdir}/usr/bin"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/mine" "${pkgdir}/usr/bin/minesweeper"
}
