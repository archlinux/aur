# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=OpenMRac-data
_pkgname2=${_pkgname%-*}
pkgname="${_pkgname,,}-git"
pkgver=r7.103f6d1
pkgrel=4
pkgdesc='Data for OpenMRac'
arch=('x86_64' 'aarch64')
url="https://github.com/Franticware/${_pkgname}"
license=('CC0')
makedepends=('git' 'sox')
depends=('gsm')
source=("git+${url}.git")
sha256sums=('SKIP')
conflicts=(${_pkgname})
provides=(${_pkgname})

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
  install -Dm644 "${_pkgname2,,}.dat" "${pkgdir}/usr/share/${_pkgname2,,}/${_pkgname2,,}.dat"
}
