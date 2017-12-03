# Maintainer: Quentin Bazin <quent42340 at gmail dot com>

_pkgname=eifl
pkgname="${_pkgname}-dev-git"
pkgver=0.0.1
pkgrel=1
pkgdesc="Epitech Intra for Linux (development version)"
arch=("i686" "x86_64")
url="https://github.com/Quent42340/EIFL"
depends=("qt5-base" "qtkeychain" "curl")
makedepends=("cmake" "cpr-git")
provides=("eifl")
conflicts=("eifl-git")
source=("${_pkgname}::git+${url}.git#branch=dev")
md5sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	cmake .
	cmake --build .
}

package() {
	cmake --build "${_pkgname}" --target install -- DESTDIR="${pkgdir}"
}

