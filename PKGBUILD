# Maintainer: Art Dev <artdevjs at gmail dot com>

pkgname=plasma5-applets-kpplemenu-git
_gitname=org.kpple.kppleMenu
pkgver=r13.04fbbdc
pkgrel=1
pkgdesc="The Kpple menu is the drop-down menu of Kpple OS."
arch=('any')
url="https://github.com/kppleos/org.kpple.kppleMenu"
license=('GPL2')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git')
provides=('plasma5-applets-kpplemenu')
conflicts=('plasma5-applets-kpplemenu')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "${pkgdir}/usr/share/plasma/plasmoids"
  cp -r ${srcdir}/${_gitname}/package "${pkgdir}/usr/share/plasma/plasmoids/${_gitname}"
}
