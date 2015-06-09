# Maintainer: Damien Guihal <dguihal@gmail.com>

pkgname=quteqoin-git
pkgver=r547.d4dae89
pkgrel=1
pkgdesc="Tool based on Qt framework to allow effective mouling on bouchots."
arch=('i686' 'x86_64')
url="https://github.com/ototu/quteqoin"
license="GPL"
depends=('qt4')
makedepends=('git')
provides=('quteqoin')
source=('quteqoin::git+https://github.com/ototu/quteqoin.git')
sha1sums=('SKIP')

pkgver() {
  cd "quteqoin"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "quteqoin"

	#
	# BUILD HERE
	#
	qmake-qt4 PREFIX=/usr
	make
}

package() {
	cd "quteqoin"
	make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
