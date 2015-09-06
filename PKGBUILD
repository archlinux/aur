# Maintainer: Geoffrey Frogeye <geoffrey+aur@frogeye.fr>

_pkgname=check-sieve
pkgname=${_pkgname}-git
pkgver=20150905.682d967
pkgrel=1
pkgdesc="Syntax checker for mail sieves."
arch=('i686' 'x86_64')
url="https://github.com/dburkart/${_pkgname}"
license=('custom')
groups=()
depends=()
makedepends=('git' 'gcc' 'make' 'bison' 'flex')
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
backup=()
options=()
install=
changelog=
source=("${_pkgname}::git+https://github.com/dburkart/${_pkgname}.git")
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

#check() {
#	cd "${srcdir}/${_pkgname}"
#	make test
#}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 check-sieve "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

