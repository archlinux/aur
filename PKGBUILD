# Maintainer: Benjamin Hodgetts <ben@xnode.org>

_gitname=f2bgl
pkgname=${_gitname}-git
pkgver=r174.d488ad8
pkgrel=1
pkgdesc="Open source reimplementation of the Fade to Black engine."
arch=('i686' 'x86_64')
url="https://github.com/cyxx/${_gitname}"
license=('GPLv3')
makedepends=('make' 'git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("${_gitname}::git+https://github.com/cyxx/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_gitname}"
	make
}

package() {
	cd "${_gitname}"

	install -Dm755 "f2bgl" "${pkgdir}/usr/bin/${_gitname}"
}
