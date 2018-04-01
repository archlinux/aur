# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=qgo-git
_pkgname=qgo
pkgver=20171218.bef526d
pkgrel=1
pkgdesc='Go Client based on Qt 5'
url='https://github.com/pzorin/qgo'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
makedepends=('git')
depends=('qt5-multimedia' 'qt5-tools')
source=("git://github.com/pzorin/qgo.git")
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}/src"
	qmake-qt5
	make
}

package() {
	cd "${srcdir}/${_pkgname}/src"
	make INSTALL_ROOT="${pkgdir}" install
}
