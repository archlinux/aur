# Maintainer: Dario Pellegrini <pellegrini dot dario at gmail dot com>

pkgname='openscad-dotscad-git'
_gitname='dotSCAD'
pkgver=r1536.a5e7d1b
pkgrel=2
pkgdesc='Collection of helpful OpenSCAD modules and functions from Justin Lin'
url='https://github.com/JustinSDK/dotSCAD'
arch=('any')
depends=('openscad')
makedepends=('git')
license=('LGPL')
source=("git+https://github.com/JustinSDK/dotSCAD.git")
sha512sums=( 'SKIP')

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
 mkdir -p $pkgdir/usr/share/openscad/libraries/dot/
 cd "$_gitname/src"
 find . -type f -name '*.scad' -exec install -Dm 744 "{}" "$pkgdir/usr/share/openscad/libraries/dot/{}" \;
}

