# Maintainer: Dario Pellegrini <pellegrini dot dario at gmail dot com>

pkgname='openscad-dotscad-git'
_gitname='dotSCAD'
pkgver=r846.7648373
pkgrel=1
pkgdesc='Collection of helpful OpenSCAD modules and functions from Justin Lin'
url='https://github.com/JustinSDK/dotSCAD'
license=(
 'LGPL'
)
source=(
 "git+https://github.com/JustinSDK/dotSCAD.git"
)
sha512sums=(
 'SKIP'
)
arch=(
 'any'
)
depends=(
 'openscad'
)
install=openscad-dotscad-git.install

pkgver() {
 cd "$_gitname"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
 # nop
 cat /dev/null
}

package() {
 mkdir -p $pkgdir/usr/share/openscad/libraries/dot/__private__
 cd "$_gitname"
 install -Dm644 src/*.scad $pkgdir/usr/share/openscad/libraries/dot/
 install -Dm644 src/__private__/*.scad $pkgdir/usr/share/openscad/libraries/dot/__private__
}

