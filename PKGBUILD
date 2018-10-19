# Maintainer: Ricky Liou <rliou92@gmail.com>
pkgname=umonitor-git
_gitname=umonitor
pkgver=r180.0591487
pkgrel=1
pkgdesc="Dynamic monitor configuration"
arch=('i686' 'x86_64')
url="https://github.com/rliou92/umonitor"
license=('MIT')
depends=('libconfig' 'libxcb')
makedepends=('git')
install=${_gitname}.install
source=("git://github.com/rliou92/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$_gitname
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$_gitname
	make
}

package() {
	cd $srcdir/$_gitname
	make DESTDIR="$pkgdir" install
}
