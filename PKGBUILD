# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=losci
pkgname=${_pkgname}-git
pkgver=r3.c46c934
pkgrel=1
pkgdesc='Digital oscilloscope for visualizing sound.'
arch=('any')
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('luajit-sdl3' 'sdl3_image')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 ${_pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg
  install -Dm 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm 755 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
