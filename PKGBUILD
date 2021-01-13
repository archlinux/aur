# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=borg-backup-gui-git
pkgver=330.2111867
pkgrel=1
pkgdesc="Borg BackUP GUI can be used by new Borg users to get to their destination very quickly."
url="https://github.com/MTrage/Borg-BackUP-GUI"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python-llfuse' 'qt5-base')
makedepends=('git')
optdepends=('adwaita-icon-theme')

_gitname=Borg-BackUP-GUI
source=("git+https://github.com/MTrage/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}/src"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}/src"
  qmake
  make
}

package() {
  cd "${_gitname}/src"
  install -Dm755 "BORG-BackUP-GUI" "${pkgdir}/usr/bin/BORG-BackUP-GUI"
}
