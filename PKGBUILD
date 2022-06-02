# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=rofi-cmus
pkgname=${_pkgname}-git
pkgver=r5.2269e2c
pkgrel=2
pkgdesc="Rofi frontend for Cmus"
arch=('any')
url="https://github.com/vojdel/rofi-cmus.git"
license=('unknown')
depends=('rofi' 'cmus')
makedepends=('git')
provides=(${_pkgname})
source=("${_pkgname}::git+https://github.com/vojdel/rofi-cmus.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"/"${_pkgname}"
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
