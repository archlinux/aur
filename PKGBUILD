# Maintainer: timescam <timescam at duck dot com>
pkgname=dracula-cursors-git
_pkgname=gtk
pkgver=v3.0.r5.gfa54bba
pkgrel=1
pkgdesc="Dracula theme cursors"
arch=("any")
url="https://github.com/dracula/${_pkgname}"
license=("GPL3")
provides=("dracula-cursors")
makedepends=("git")
source=("git+https://github.com/dracula/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "${_pkgname}/kde"
  mkdir -p "${pkgdir}/usr/share/icons"
  cp -r cursors/Dracula-cursors "${pkgdir}/usr/share/icons"
}
