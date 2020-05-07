# Maintainer: Tony Fettes <feihaoxiang2014@gmail.com>

pkgname=bibata-extra-cursor-git
_gitname=Bibata_Extra_Cursor
pkgver=r44.7cdac56
pkgrel=1
pkgdesc="Extra Material Based Cursor Theme"
arch=('any')
url="https://github.com/KaizIqbal/Bibata_Extra_Cursor"
license=('GPL3')
makedepends=('git' 'python' 'inkscape' 'xorg-xcursorgen' 'python-pillow')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_gitname}
  chmod +x build.sh
  echo 5 > ./build.sh
}

package() {
  mkdir -p "${pkgdir}/usr/share/icons"
  mv "${srcdir}/${_gitname}/Bibata_Dark_Red/out/X11/Bibata_Dark_Red" "${pkgdir}/usr/share/icons"
  mv "${srcdir}/${_gitname}/Bibata_Dodger_Blue/out/X11/Bibata_Dodger_Blue" "${pkgdir}/usr/share/icons"
  mv "${srcdir}/${_gitname}/Bibata_Pink/out/X11/Bibata_Pink" "${pkgdir}/usr/share/icons"
  mv "${srcdir}/${_gitname}/Bibata_Turquoise/out/X11/Bibata_Turquoise" "${pkgdir}/usr/share/icons"
}
