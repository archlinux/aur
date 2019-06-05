# Maintainer: Geoffrey Frogeye <geoffrey+aur@frogeye.fr>

_pkgname=check-sieve
pkgname=${_pkgname}-git
pkgver=20190514.8fe4f97
pkgrel=1
pkgdesc="Syntax checker for mail sieves."
arch=('i686' 'x86_64')
url="https://github.com/dburkart/${_pkgname}"
license=('custom')
depends=('gcc-libs')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/dburkart/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 check-sieve "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

