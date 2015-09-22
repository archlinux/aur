# Maintainer: Raphael Scholer <rascholer@gmail.com>
_pkgname=desktoggle
pkgname=${_pkgname}-git
pkgver=1.5.1.r2.gf1e3060
pkgrel=1
pkgdesc='Hide all windows and show the desktop.'
arch=('i686' 'x86_64')
url="https://github.com/rscholer/${_pkgname}"
license=('GPL3')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('asciidoc' 'git')
depends=('libx11')
source=("git+${url}")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"
  make
}

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" prefix="/usr" install
}
# vim:set ts=2 sw=2 et:
