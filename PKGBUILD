# Maintainer: Geoffrey Frogeye <geoffrey+aur@frogeye.fr>

pkgname=check-sieve
pkgver=0.3
_gitver=682d96738d26291b76a908b094d125877d30e1a2
pkgrel=1
pkgdesc="Syntax checker for mail sieves."
arch=('i686' 'x86_64')
url="https://github.com/dburkart/${pkgname}"
license=('custom')
groups=()
depends=()
makedepends=('git' 'gcc' 'make' 'bison' 'flex')
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}")
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/dburkart/${pkgname}.git#commit=${_gitver}")
noextract=()
md5sums=('SKIP')


build() {
	cd "${srcdir}/${pkgname}"
	make
}

#check() {
#	cd "${srcdir}/${pkgname}"
#	make test
#}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 check-sieve "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

