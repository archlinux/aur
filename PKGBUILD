# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=obs-studio-themed
pkgname=${_pkgname}-git
pkgver=r2.a24f04d
pkgrel=1
pkgdesc='A themed look for OBS Studio'
arch=('any')
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=('GPL-2.0-or-later')
depends+=('obs-studio')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ${pkgdir}/usr/share/obs/obs-studio/themes/
  install -Dm 644 Themed.obt ${pkgdir}/usr/share/obs/obs-studio/themes/
  install -Dm 644 Themed_Dark.ovt ${pkgdir}/usr/share/obs/obs-studio/themes/
  install -Dm 644 Themed_Light.ovt ${pkgdir}/usr/share/obs/obs-studio/themes/
}
