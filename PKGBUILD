# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=xcursor-simp1e
pkgname=(xcursor-simp1e{,-dark,-breeze})
pkgdesc='An aesthetic cursor theme'
pkgver=0.0.20210227
pkgrel=1
url=https://gitlab.com/zoli111/simp1e/
_commit=1ec1162934606861cda71b4658a50df597fa52e1
arch=(any)
makedepends=(git inkscape python2 xorg-xcursorgen)
depends=()
license=(GPL3)
source=("${pkgname}::git+${url}?commit=${_commit}")
sha512sums=(SKIP)

_variants=(Simp1e Simp1e-dark Simp1e-breeze)

build () {
	cd "${pkgname}"
	yes | ./build.sh
}

_package () {
	install -dm755 "${pkgdir}/usr/share/icons"
	cp -a "${pkgbase}/BuiltThemes/$1/$1" "${pkgdir}/usr/share/icons"
}

package_xcursor-simp1e () {
	_package Simp1e
}

package_xcursor-simp1e-dark () {
	_package Simp1e-dark
}

package_xcursor-simp1e-breeze () {
	_package Simp1e-breeze
}
