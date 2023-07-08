# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=phing
pkgver=2.17.4
pkgrel=1
pkgdesc="PHP project build system based on Apache Ant."
arch=(any)
url="http://www.phing.info/"
license=(LGPL)
depends=(php)
install="${pkgname}.install"
source=(
    "https://github.com/phingofficial/phing/releases/download/${pkgver}/phing-${pkgver}.phar"
    "phing.install"
)
sha512sums=(
    "db74e90a8a61c6108c16300edbebcfacd8452abec565c4e997ad3e0c2c41814e3717f00e4a714686c299bf0b36f8f6ab23aae86b1cd4b609218a3ae2a3d1de02"
    "bbe10167e144a65eaf4900d23d0cd6f5ffca56f716c158e844349e88ba4ecf7401bcefbfa89f2a53ea1ebe82c5822bb7827921bbf1c01524dc9d47710e255765" # phing.install
)
validpgpkeys=(
    "566E877A27BD4343E956BC9D2420BAE0A3BE25C6"
)

package() {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${pkgname}-${pkgver}.phar"
    ln --relative -s "${pkgdir}/usr/bin/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/phing"
}
