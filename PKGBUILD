# SPDX-License-Identifier: MIT
#  Copyright (c) Ahmed G. Gad ----------------------  #
#      Website:   https://ahmedgad.com                #
#      Email:     mailto:me@ahmedgad.com              #
#      Github:    https://github.com/Gad360           #
#  Licensed under MIT; see LICENSE for terms ------  #

# Maintainer: Ahmed G. Gad <me@ahmedgad.com>

pkgname=apothem
pkgver=0.1.0
pkgrel=1
pkgdesc="Host-agnostic AI-harness configuration manager."
arch=('any')
url="https://apothem.ahmedgad.com"
license=('MIT')
depends=('bash' 'python')
source=("${pkgname}-v${pkgver}-linux.tar.gz::https://github.com/Gad360/apothem/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux.tar.gz")
sha256sums=('7e543c1dfc3234e5114add6f6c6fc09c6ad54616e5a81f6436f6e12fa6f1cb50')

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -a . "${pkgdir}/usr/share/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
