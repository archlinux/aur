# Maintainer: Damien Guihal <dguihal@gmail.com>
# Do not forget SRCINFO :  makepkg --printsrcinfo > .SRCINFO
pkgname=quteqoin-git
pkgver=r684.f992910
pkgrel=1
pkgdesc="Tool based on Qt framework to allow effective mouling on bouchots."
arch=('i686' 'x86_64')
url="https://github.com/dguihal/quteqoin"
license=('GPL')
depends=('qt5-base' 'qt5-multimedia')
makedepends=('git')
provides=('quteqoin')
source=('quteqoin::git+https://github.com/dguihal/quteqoin.git')
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
	qmake-qt5 PREFIX=/usr
	make
}

package() {
	cd "quteqoin"
	make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
