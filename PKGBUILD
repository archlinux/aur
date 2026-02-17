# Maintainer: xCaptaiN09 <https://github.com/xCaptaiN09>
pkgname=pixie-sddm-git
_pkgname=pixie-sddm
pkgver=r1.v2.0
pkgrel=1
pkgdesc="Material Design 3 inspired SDDM theme with dynamic color extraction"
arch=('any')
url="https://github.com/xCaptaiN09/pixie-sddm"
license=('MIT')
install="pixie-sddm.install"
depends=('sddm' 'qt5-graphicaleffects' 'qt5-quickcontrols2' 'qt5-svg')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/xCaptaiN09/pixie-sddm.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -d "${pkgdir}/usr/share/sddm/themes/pixie"
  cp -r assets components Main.qml metadata.desktop theme.conf LICENSE "${pkgdir}/usr/share/sddm/themes/pixie/"
}
