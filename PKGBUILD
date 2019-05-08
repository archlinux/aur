# Maintainer: Dario Pellegrini <pellegrini dot dario at gmail dot com>

pkgname='openscad-mcad-git'
_gitname='MCAD'
pkgver=r226.a7be3d6
pkgrel=1
pkgdesc='OpenSCAD library containing several facilities easily construct mechanical objects'
url='https://github.com/openscad/MCAD'
license=(
 'LGPL'
)
source=(
 "git+https://github.com/openscad/MCAD.git"
)
sha512sums=(
 'SKIP'
)
arch=(
 'x86_64'
 'i686'
)
depends=(
 'openscad'
)

pkgver() {
 cd "$_gitname"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
 # nop
 cat /dev/null
}

package() {
 mkdir -p $pkgdir/usr/share/openscad/libraries/MCAD/
 cd "$_gitname"
 install -Dm644 *.scad $pkgdir/usr/share/openscad/libraries/MCAD/
}
