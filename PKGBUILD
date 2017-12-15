# Maintainer: Spencer Harmon <spencer at rsitex dot com>

pkgname="jackmidi2osc-git"
pkgver=0.2.r2.gedc653c
pkgrel=1
epoch=
pkgdesc="Github version of ulam compiler and MFM simulator"
arch=('any')
url="https://github.com/x42/jackmidi2osc"
license=('(L)GPL3')
groups=()
depends=('liblo'
	'jack')
makedepends=('make'
	'gcc'
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

build() {
	make -C jackmidi2osc
}

package() {
	make -C "$srcdir/jackmidi2osc" DESTDIR="$pkgdir/" install
}
