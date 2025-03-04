# Maintainer: Yukina <thienphuc3230 at gmail dot com>

_pkgname="qogir-cursor-theme"
pkgname="${_pkgname}-git"
gitname="Qogir-icon-theme"
pkgver=r312.4abc106e
pkgrel=1
pkgdesc="An x-cursor theme inspired by Qogir theme and based on capitaine-cursors"
arch=("any")
url="https://github.com/vinceliuice/${gitname}"
license=("GPL3")
makedepends=("git")
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${gitname}/src/cursors/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/icons/"
  cd "${srcdir}/${gitname}/src/cursors/"
  cp -r dist/ ${pkgdir}/usr/share/icons/Qogir-cursors/
  cp -r dist-Dark/ ${pkgdir}/usr/share/icons/Qogir-white-cursors/
  cp -r dist-Ubuntu/ ${pkgdir}/usr/share/icons/Qogir-Ubuntu-cursors/
  cp -r dist-Ubuntu-Dark/ ${pkgdir}/usr/share/icons/Qogir-Ubuntu-white-cursors/
  cp -r dist-Manjaro/ ${pkgdir}/usr/share/icons/Qogir-Manjaro-cursors/
  cp -r dist-Manjaro-Dark/ ${pkgdir}/usr/share/icons/Qogir-Manjaro-white-cursors/
}
