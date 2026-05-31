# SPDX-License-Identifier: MIT

# Maintainer: Ahmed G. Gad <me@ahmedgad.com>

pkgname=apothem
pkgver=0.1.8
pkgrel=1
pkgdesc="Host-agnostic AI-harness configuration manager."
arch=('any')
url="https://apothem.ahmedgad.com"
license=('MIT')
depends=('bash' 'python')
source=("${pkgname}-v${pkgver}-linux.tar.gz::https://github.com/ahmed-g-gad/apothem/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux.tar.gz")
sha256sums=('1a9f506bc1d18bd19144d819d3857af75a6dd2f9859f926f7a55d3d51e3bdd41')

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -a . "${pkgdir}/usr/share/${pkgname}/"
  chmod 0755 "${pkgdir}/usr/share/${pkgname}/bin/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
