# Maintainer: Janne Heß <jannehess@gmail.com>

# Contributor: Hendrik Luup <hendrik at luup dot info>

pkgname=dvorakng
pkgver=0.6.0rc1
pkgrel=4
pkgdesc="A Dvorak typing tutor. It's heavily based on Dvorak7min, but adds many improvements."
url="http://freshmeat.net/projects/${pkgname}/"
license=('GPL')
makedepends=('make' 'gcc')
source=("http://www.free.of.pl/n/nopik/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('87f0bb2199188093ea4223d7dc47232f53b266aa9498170b643c25e724f547fa1ce5d0e1d4e7f275c712f6ec4850d825827b66f84407f186eb80b73ac973ded7')
arch=('i686' 'x86_64')

build() {
	cd "${srcdir}/${pkgname}"
	make || return 1
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

