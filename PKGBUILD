# Maintainer: Tony Fettes <feihaoxiang2014@gmail.com>

pkgname=plasma5-applets-chiliclock-git
_gitname=kde-plasmoid-betterinlineclock
pkgver=r24.bbad71b
pkgrel=1
pkgdesc="The hottest clock around on a single line!"
arch=('any')
url="https://github.com/MarianArlt/kde-plasmoid-betterinlineclock"
license=('GPL3')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git')
provides=('plasma5-applets-betterinlineclock')
conflicts=('plasma5-applets-betterinlineclock')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "${pkgdir}/usr/share/plasma/plasmoids"
  cp -r ${srcdir}/${_gitname}/org.kde.plasma.betterinlineclock "${pkgdir}/usr/share/plasma/plasmoids"
}
