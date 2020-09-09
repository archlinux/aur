# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=mpreal-git
pkgver=3.6.7.r7.g2c5e632
pkgrel=1
pkgdesc="Multiple precision floating point (MPFR) arithmetic library for C++"
url="http://www.holoborodko.com/pavel/mpfr/"
arch=('any')
license=('GPL3')
depends=('mpfr')

source=("${pkgname%-git}::git+https://github.com/advanpix/mpreal.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^mpfrc++-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm644 "${srcdir}"/${pkgname%-git}/${pkgname%-git}.h "${pkgdir}"/usr/include/${pkgname%-git}.h
}
