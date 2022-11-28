# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=mdtree
pkgver=1.0.0
pkgrel=1
pkgdesc="a simple cli application to print filetree in markdown friendly format"

arch=('x86_64')
url="https://codeberg.org/akselmo/mdtree/releases"
license=('AGPL')
makedepends=('cmake')
source=(https://codeberg.org/akselmo/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('b851d6016d52aa65725afc398b4629bd5b21ea9a8cb6b4a31138d12fb1de76a730f0224acb699db72303d7b78b6397bad37019f224bb3c587f1615077d34c404')

build() {
	cmake -B build -S "${pkgname}"
	cmake --build build
}

package() {
	install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
