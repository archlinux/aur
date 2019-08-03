# Maintainer: TilCreator <signup dot aur at tc minus j dot de>

pkgname='openscad-lasercut-git'
_gitname='lasercut'
pkgver=r79.1b1c738
pkgrel=1
pkgdesc='Module for openscad, allowing 3d models to be created from 2d lasercut parts'
url='https://github.com/bmsleight/lasercut.git'
license=(
 'BSD 2-Clause'
)
source=(
 "git+https://github.com/bmsleight/lasercut.git"
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
install=openscad-lasercut-git.install

pkgver() {
 cd "$_gitname"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
 # nop
 cat /dev/null
}

package() {
 mkdir -p $pkgdir/usr/share/openscad/libraries/lasercut/
 cd "$_gitname"
 install -Dm 744 "lasercut.scad" "$pkgdir/usr/share/openscad/libraries/lasercut/lasercut.scad"
 install -Dm 755 "convert-2d.sh" "$pkgdir/usr/bin/convert-2d"
}
