# Maintainer: Dario Pellegrini <pellegrini dot dario at gmail dot com>

pkgname='openscad-list-compr-demos-git'
_gitname='list-comprehension-demos'
pkgver=r22.dec3fc3
pkgrel=1
pkgdesc='Provides advanced OpenSCAD functions such as sweep and skin'
url='https://github.com/openscad/list-comprehension-demos'
license=(
 'MIT'
)
source=(
 "git+https://github.com/openscad/list-comprehension-demos.git"
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
 'openscad-scad-utils-git'
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
 mkdir -p $pkgdir/usr/share/openscad/libraries/list-comprehension-demos/
 cd "$_gitname"
 install -Dm644 *.scad $pkgdir/usr/share/openscad/libraries/list-comprehension-demos/
}
