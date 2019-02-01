# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=plasma5-applets-simpleweather-git
_pkgname=plasma5-applets-simpleweather
_gitpkgname=plasma-applet-simpleweather
pkgver=r25.73464b0
pkgrel=1
pkgdesc="Plasmoid for Plasma 5. A minimalistic desktop weather widget based on the default KDE one."
arch=('any')
url="https://github.com/Zren/$_gitpkgname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects')
makedepends=('git' 'extra-cmake-modules')
source=("git+https://github.com/Zren/$_gitpkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitpkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitpkgname}/package"
  mkdir -p $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.simpleweather
  cp -r * $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.simpleweather/
}
