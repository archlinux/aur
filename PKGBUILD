# Maintainer: Tony Fettes <feihaoxiang2014@gmail.com>

pkgname=plasma5-applets-chiliclock-git
_gitname=kde-plasmoid-chiliclock
pkgver=r14.399e5e1
pkgrel=1
pkgdesc="The hottest clock around on a single line!"
arch=('any')
url="https://github.com/MarianArlt/kde-plasmoid-chiliclock"
license=('GPL3')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git')
provides=('plasma5-applets-chiliclock')
conflicts=('plasma5-applets-chiliclock')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "${pkgdir}/usr/share/plasma/plasmoids"
  cp -r ${srcdir}/${_gitname}/org.kde.plasma.chiliclock "${pkgdir}/usr/share/plasma/plasmoids"
}
