# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=plasma5-applets-simpleweather-git
pkgver=r115.74e6e10
pkgrel=1
pkgdesc="A minimalistic desktop weather widget based on the default KDE one."
arch=('any')
url="https://github.com/Zren/plasma-applet-simpleweather"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects' 'kdeplasma-addons')
makedepends=('git' 'extra-cmake-modules')
replaces=("kdeplasma-applets-simpleweather-git")
source=("${pkgname}::git+https://github.com/Zren/plasma-applet-simpleweather.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}/package"
  mkdir -p $pkgdir/usr/share/plasma/plasmoids/com.github.zren.simpleweather
  cp -r * $pkgdir/usr/share/plasma/plasmoids/com.github.zren.simpleweather/
}
