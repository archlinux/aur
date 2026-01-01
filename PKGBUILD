# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=WriteTeX
pkgname=${_base,,}
pkgver=2.0.0
pkgrel=1
pkgdesc="Latex/Tex editor for Inkscape"
arch=(any)
url="https://github.com/wanglongqi/${_base}"
license=(GPL-3.0-or-later)
depends=(inkscape python-lxml pdf2svg)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ca42919f34a885fc24634b0bbf545cd52e2842b11d4d092b9dd27379aa10ab1742e0038f8f3474ed20f3452b64d9d350870e5c52c9cf257a88fa3b388e521e40')

package() {
  cd ${_base}-${pkgver}/1.x.x
  install -m755 -Dt "${pkgdir}/usr/share/inkscape/extensions" ${pkgname}.py
  install -m644 -Dt "${pkgdir}/usr/share/inkscape/extensions" ${pkgname}.inx
}
