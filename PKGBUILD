# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname="among-sus"
pkgname="${_pkgname}-git"
pkgver=r73.02f42a1
pkgrel=1
pkgdesc="Among Us, but it's a text adventure"
arch=('i686' 'x86_64')
url="https://sr.ht/~martijnbraam/${_pkgname}/"
license=('AGPL3')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://git.sr.ht/~martijnbraam/among-sus")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm755 among-sus ${pkgdir}/usr/bin/among-sus
}
