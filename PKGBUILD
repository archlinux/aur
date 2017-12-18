# Maintainer: Julian Geywitz <aur@geigi.de>+

pkgname=color-picker-git
_gitname=ColorPicker
pkgdesc='One Color Picker to rule them all! No overhelming menus or settings. An easy tool with the features you need.'
pkgver="20171218"
pkgrel=1
url='https://github.com/RonnyDo/ColorPicker'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('meson' 'ninja' 'vala' 'granite' 'git')
depends=(
  'gtk3' 'granite'
)
conflicts=("${_gitname}")
provides=("${_gitname}")
source=(
  "git://github.com/RonnyDo/ColorPicker.git"
  
)
sha256sums=(
  'SKIP'
)

build() {
    cd "$_gitname"
    meson build && cd build
    meson configure -Dprefix=/usr
    ninja
}

package() {
    cd "${_gitname}/build"
    DESTDIR="${pkgdir}" ninja install
}
