# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='openscad-scad-utils-git'
_gitname='scad-utils'
pkgver=r22.ccf430e
pkgrel=1
pkgdesc='OpenSCAD utility functions'
url='https://github.com/openscad/scad-utils'
license=(
 'MIT'
)
source=(
 "git+https://github.com/openscad/scad-utils.git"
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
 mkdir -p $pkgdir/usr/share/openscad/libraries/scad-utils/
 cd "$_gitname"
 install -Dm644 *.scad $pkgdir/usr/share/openscad/libraries/scad-utils/
}
