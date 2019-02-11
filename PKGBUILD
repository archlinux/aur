# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=phing
pkgver=2.16.1
pkgrel=1
pkgdesc="PHP project build system based on Apache Ant."
arch=(any)
url="http://www.phing.info/"
license=(LGPL)
depends=(php)
install="${pkgname}.install"
source=(
    "https://github.com/phingofficial/phing/releases/download/${pkgver}/phing-${pkgver}.phar"
    "https://github.com/phingofficial/phing/releases/download/${pkgver}/phing-${pkgver}.phar.asc"
    phing.install
)
sha512sums=(
    fc3ec05b6540642f4aa33e219d08b9c850eb0dc3921acf171b5055e07e62d06d934d6cd32e7b5bdfdd6a13a53acd600eaa36f8f19a37bb835919e339abd103af # phing.phar
    237b2623ff26a09697771cefb68eac162bc8b3fd28d4b67545e5c181bfa4a4f3f03db6387be1638abfcf905c8193dd3948d32a9e3c77748d99231d55ad60f592 # phing.phar.asc
    bbe10167e144a65eaf4900d23d0cd6f5ffca56f716c158e844349e88ba4ecf7401bcefbfa89f2a53ea1ebe82c5822bb7827921bbf1c01524dc9d47710e255765 # phing.install
)
validpgpkeys=(
    "566E877A27BD4343E956BC9D2420BAE0A3BE25C6"
)

package() {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/${pkgname}-${pkgver}.phar"
    ln --relative -s "${pkgdir}/usr/bin/${pkgname}-${pkgver}.phar" "${pkgdir}/usr/bin/phing"
}
