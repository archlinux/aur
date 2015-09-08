# Maintainer: Philipp Joram <phijor AT t-online DOT de>

_gitname=gba-pkm-save-edit
pkgname=${_gitname}-git
pkgver=0.r187.753ccb3
pkgrel=1
pkgdesc="A commandline application to edit save files of Pokémon-games for the GBA"
arch=('x86_64')
url="https://github.com/phijor/gba-pkm-save-edit"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'make')
source=("${pkgname}::git+https://github.com/phijor/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make -Orecurse
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 0755 ${_gitname} "${pkgdir}/usr/bin/${_gitname}"
}

# vim:set ts=2 sw=2 et:
