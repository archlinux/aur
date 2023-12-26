# Maintainer: Yukina <yukihana3230 at gmail dot com>

_pkgname="qogir-cursor-theme"
pkgname="$_pkgname-git"
pkgver=2023.06.05.r5.g7edbf61f
pkgrel=1
pkgdesc="An x-cursor theme inspired by Qogir theme and based on capitaine-cursors"
arch=("any")
url="https://github.com/vinceliuice/${_pkgname}"
license=("GPL3")
makedepends=("git")
provides=("${_pkgname}")
conflicts=(${provides[@]})
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}/src/cursors/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/icons"
  cd "${srcdir}/{$_pkgname}/src/cursors/"
  cp -r "dist" "${pkgdir}/usr/share/icons/Qogir-cursors"
  cp -r "dist-dark" "${pkgdir}/usr/share/icons/Qogir-dark-cursors"
  cp -r "dist-manjaro" "${pkgdir}/usr/share/icons/Qogir-manjaro-cursors"
  cp -r "dist-manjaro-dark" "${pkgdir}/usr/share/icons/Qogir-manjaro-dark-cursors"
  cp -r "dist-ubuntu" "${pkgdir}/usr/share/icons/Qogir-ubuntu-cursors"
  cp -r "dist-ubuntu-dark" "${pkgdir}/usr/share/icons/Qogir-ubuntu-dark-cursors"
}
