# Maintainer: Speedy_Lex <speedy_lex@tuta.io>
# Contributor: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms-fixed
pkgdesc="Fork of amneziawg-dkms fixing many issues with the PKGBUILD. Original maintainer unresponsive as of 2025-04-17"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("any")
pkgver=1.0.20251104
pkgrel=1
license=('GPLv2')
depends=("dkms")
makedepends=("linux-headers")
provides=("amneziawg-dkms")
conflicts=("amneziawg-dkms")
source=("amneziawg-linux-kernel-module-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5a6962d6cf49b97facd0ffa724a7a15b8736f7774086e0cc260ceac86d728ad8d72b42f8e6df4912bdd64ec17bbc732ba0540592996bda10221dfa87b1414bc9')

package() {
    cd "${srcdir}/amneziawg-linux-kernel-module-${pkgver}"

    install -d "${pkgdir}/usr/src/amneziawg-${pkgver}"
    cp -r ./src/* "${pkgdir}/usr/src/amneziawg-${pkgver}"
}
