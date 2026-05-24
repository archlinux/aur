# SPDX-License-Identifier: MIT
#  Copyright (c) Ahmed G. Gad ----------------------  #
#      Website:   https://ahmedgad.com                #
#      Email:     mailto:me@ahmedgad.com              #
#      Github:    https://github.com/ahmed-g-gad      #
#  Licensed under MIT; see LICENSE for terms -------  #

# Maintainer: Ahmed G. Gad <me@ahmedgad.com>

pkgname=apothem
pkgver=0.1.2
pkgrel=1
pkgdesc="Host-agnostic AI-harness configuration manager."
arch=('any')
url="https://apothem.ahmedgad.com"
license=('MIT')
depends=('bash' 'python')
source=("${pkgname}-v${pkgver}-linux.tar.gz::https://github.com/ahmed-g-gad/apothem/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux.tar.gz")
sha256sums=('002e2c7c04e5b304d32752661ad77cf19cb1108e27414c085b3b7ef5895d8d82')

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -a . "${pkgdir}/usr/share/${pkgname}/"
  chmod 0755 "${pkgdir}/usr/share/${pkgname}/bin/${pkgname}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
