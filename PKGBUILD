# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=WriteTeX
pkgname=${_base,,}
pkgver=1.9.0
pkgrel=1
pkgdesc="Latex/Tex editor for Inkscape"
arch=(any)
url="https://github.com/wanglongqi/${_base}"
license=(GPL-3.0-or-later)
depends=(inkscape python-lxml pdf2svg)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e24943b81900ec429c938271b6e5da6e4915a54c6fe169ff323653c8b21a58ae5aed26848bb1983be673d2e3de170d564ea5914437f01a5cc90210ac8ede212a')

package() {
  cd ${_base}-${pkgver}/1.x.x
  install -m755 -Dt "${pkgdir}/usr/share/inkscape/extensions" ${pkgname}.py
  install -m644 -Dt "${pkgdir}/usr/share/inkscape/extensions" ${pkgname}.inx
}
