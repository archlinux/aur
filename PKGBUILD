#Maintainer: Aleksandr Grehov <alewmoose@gmail.com>
#Contributor: Aleksandr Grehov

_pkgname='2048term'
pkgname="${_pkgname}-git"
pkgver=20150108.3eafde9
pkgrel=2
pkgdesc='Console version of the game "2048"'
url='https://github.com/alewmoose/2048-in-terminal.git'
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=('ncurses')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/alewmoose/2048-in-terminal.git")
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

check() {
	true
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 2048 "${pkgdir}/usr/bin/2048t"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
