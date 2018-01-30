# Maintainer: Spencer Harmon <spencer at rsitex dot com>

pkgname="jackmidi2osc-git"
pkgver=0.2.r2.gedc653c
pkgrel=3
epoch=
pkgdesc="Github version of jackmidi2osc"
arch=('any')
url="https://github.com/x42/jackmidi2osc"
license=('(L)GPL3')
groups=()
depends=('liblo'
	'jack')
makedepends=('make'
	'gcc'
	'perl'
	'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!buildflags' '!makeflags')
install=
changelog=
source=("git://github.com/x42/jackmidi2osc")
noextract=()
md5sums=('SKIP')
pkgver(){
	cd jackmidi2osc
	git describe --tags| sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
	perl -0777 -i -pe 's/(\/usr)\/local/$1/' jackmidi2osc/Makefile
}

build() {
	make -C jackmidi2osc
}

package() {
	make -C "$srcdir/jackmidi2osc" DESTDIR="$pkgdir/" install
}
