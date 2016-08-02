# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=phing
pkgver=2.14.0
pkgrel=1
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
    d93b31da0d9a2634089beab1ea776e53b4ee809395334f38529e8acdf4b88735 # phing PHAR
    9c9926fcea67efad95adceeaa973cd86f99681a74d22b93d2c5fa506679c65cd # phing.install
)

package() {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${pkgname}-${pkgver}.phar"
    ln --relative -s "${pkgdir}/usr/bin/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/phing"
}
