# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=phing
pkgver=2.16.0
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
sha512sums=(
    6974b0ea7d482d8fc9b63007c1ac47e7b60f19e23e483950e845279b8fbb97ddc03a99676f9122674df774ff3440b0126b3ae1a24078ff341262d52af4ccf938 # phing.phar
    26dfb12f0715abf2981d6cef03ee03335b8820b7f9b46392dacfd696b0d3cbdfa300cf760966c3f9f05ba9978fa30a7f1c8cc1c616c8b19292fe4eb69bc6c1c2 # phing.install
)

package() {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${pkgname}-${pkgver}.phar"
    ln --relative -s "${pkgdir}/usr/bin/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/phing"
}
