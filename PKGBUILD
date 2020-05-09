# Maintainer: Tony Fettes <feihaoxiang2014@gmail.com>

pkgname=mondrian-icon-theme-git
_gitname=Mondrian
pkgver=r32.2450232
pkgrel=1
pkgdesc="An icon themes based on Piet Mondrian's paintings."
arch=('any')
url='https://www.opencode.net/ju1464/Mondrian'
license=('GPL3')
makedepends=('git')
provides=('mondrian-icon-theme')
conflicts=('mondrian-icon-theme')
source=("git+${url}.git")
options=('!strip')
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${_gitname}/Icons
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r Mondrian "${pkgdir}/usr/share/icons"
}
