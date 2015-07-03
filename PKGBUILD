# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=mpreal-hg
pkgver=r112.248da9fd5d83
pkgrel=1
pkgdesc="Multiple precision floating point (MPFR) arithmetic library for C++"
url="http://www.holoborodko.com/pavel/mpfr/"
arch=('any')
license=('GPL3')
depends=('mpfr')

source=("${pkgname%-hg}::hg+https://bitbucket.org/advanpix/mpreal")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-hg}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
	install -Dm644 "${srcdir}"/${pkgname%-hg}/${pkgname%-hg}.h "${pkgdir}"/usr/include/${pkgname%-hg}.h
}
