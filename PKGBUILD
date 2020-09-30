# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=kdeplasma-applets-simpleweather-git
_pkgname=kdeplasma-applets-simpleweather
_gitpkgname=plasma-applet-simpleweather
pkgver=r84.72b2b94
pkgrel=1
pkgdesc="A minimalistic desktop weather widget based on the default KDE one."
arch=('any')
url="https://github.com/Zren/$_gitpkgname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects' 'kdeplasma-addons')
makedepends=('git' 'extra-cmake-modules')
source=("git+https://github.com/Zren/$_gitpkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitpkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitpkgname}/package"
  mkdir -p $pkgdir/usr/share/plasma/plasmoids/com.github.zren.simpleweather
  cp -r * $pkgdir/usr/share/plasma/plasmoids/com.github.zren.simpleweather/
}
