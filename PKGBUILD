# Maintainer: Daniel Nunes <daniel.henri.nunes at gmail dot com>
_pkgname=fortune-anti-jokes
pkgname=fortune-mod-anti-jokes-git
pkgver=r1.cc15045
pkgrel=1
pkgdesc="Anti-jokes fortune cookies"
url="https://github.com/gandag/fortune-anti-jokes"
arch=(any)
license=(unknown)
depends=('fortune-mod')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gandag/fortune-anti-jokes.git')
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
  strfile -r anti-jokes
}

package(){
	cd "$srcdir/${_pkgname}"
  mkdir -p ${pkgdir}/usr/share/fortune
  cp anti-jokes ${pkgdir}/usr/share/fortune
  cp anti-jokes.dat ${pkgdir}/usr/share/fortune
}
