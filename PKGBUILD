# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=inkscapeMadeEasy
pkgname=${_base,,}-git
pkgver=r80.c21dd9b
pkgrel=1
pkgdesc="Set of python modules that extends Aaron Spike's inkex.py module (git version)"
arch=(x86_64)
url="https://github.com/fsmMLK/${_base}"
license=(GPL3)
depends=(textext)
makedepends=(git)
source=(git+${url}.git#branch=master)
sha512sums=('SKIP')
provides=(${_base,,})
conflicts=(${_base,,})

pkgver() {
  cd ${_base}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd ${_base}
  install -d ${pkgdir}/usr/share/inkscape/extensions/${_base}
  mv latest/* ${pkgdir}/usr/share/inkscape/extensions/${_base}
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
