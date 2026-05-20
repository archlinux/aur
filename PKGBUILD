# SPDX-License-Identifier: MIT
#  Copyright (c) Ahmed G. Gad ----------------------  #
#      Website:   https://ahmedgad.com                #
#      Email:     mailto:me@ahmedgad.com              #
#      Github:    https://github.com/Gad360           #
#  Licensed under MIT; see LICENSE for terms ------  #

# Maintainer: Ahmed G. Gad <me@ahmedgad.com>

pkgname=apothem
pkgver=1.0.0
pkgrel=1
pkgdesc="One shared profile · materialized into eleven AI-coding-tool harnesses."
arch=('any')
url="https://apothem.ahmedgad.com"
license=('MIT')
depends=('bash' 'python')
source=("${pkgname}-v${pkgver}-linux.tar.gz::https://github.com/Gad360/apothem/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux.tar.gz")
sha256sums=('3f276c7ba4bc3c084c2e0290ffebadcc465a126d218118b0b84aa0289b33ce56')

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -a . "${pkgdir}/usr/share/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
