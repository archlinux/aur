# Maintainer: Sadie <zulc22db+oss@gmail.com>
pkgname=trans-glxgears-git
pkgver=r29.f42d103
pkgrel=1
pkgdesc="Transgender recolor of the glxgears mesa demo"
arch=('any')
url=""
license=('unknown')
groups=()
depends=(
	'freeglut'
	'glibc'
	'glu'
	'libgl'
	'libx11'
	'libxext'
)
makedepends=(
	'git'
	'freeglut'
	'glslang'
	'glu'
	'libdecor'
	'libxkbcommon-x11'
	'mesa'
)
provides=("trans-glxgears")
conflicts=("trans-glxgears")
replaces=()
backup=()
options=()
install=
source=('glxgears::git+https://codeberg.org/LexxyFox/glxgears.git')
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/glxgears"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {

#}

build() {
	cd "$srcdir/glxgears"
	CFLAGS=""
	make glxgears
}

package() {
	cd "$srcdir/glxgears"
	mkdir -p "$pkgdir/usr/local/bin"
	install glxgears "$pkgdir/usr/local/bin/trans-glxgears"
}
