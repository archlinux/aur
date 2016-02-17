# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=phing
pkgver=2.13.0
pkgrel=2
pkgdesc="PHP project build system based on Apache Ant."
arch=(any)
url="http://www.phing.info/"
license=(LGPL)
depends=(php)
install="${pkgname}.install"
source=(
    "http://www.phing.info/get/phing-${pkgver}.phar"
    phing.install
)
sha256sums=(
    5b08b1f44b05b02a298400aa51ede8e0849b885ed6e27357bc86f5b011876aca # phing PHAR
    9c9926fcea67efad95adceeaa973cd86f99681a74d22b93d2c5fa506679c65cd # phing.install
)

package() {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${pkgname}-${pkgver}.phar"
    ln --relative -s "${pkgdir}/usr/bin/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/phing"
}
