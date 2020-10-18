# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=ultraloop-git
_pkgname="${pkgname%-git}"
pkgver=r27.da64bf5
pkgrel=1
pkgdesc="converter from Ultrastar's song format to blitzloop's"
url="https://github.com/T045T/ultraloop"
depends=('bison' 'flex')
makedepends=('git')
license=('unknown')
arch=('x86_64')
source=("${_pkgname}"::'git+https://github.com/T045T/ultraloop')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}
  make
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/ultraloop" "${pkgdir}/usr/bin/ultraloop"
}

# vim:set ts=2 sw=2 et:
