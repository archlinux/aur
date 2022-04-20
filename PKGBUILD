# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.5.7
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan and Pingtunnel protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/v2rayA/v2rayA"
license=('AGPL3')
depends=('glibc')
optdepends=('v2ray>=4.37.0-1' 'xray>=1.4.2-1')
provides=('v2raya')
conflicts=('v2raya')

sha_service=7b201c058782a7382c3ec183e80af528c5310a6d
sha_service_lite=de6a4d5a4e1a418d2a3b27af9c513f69e5abc3b6
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=f4abf270b2ce588a4e8ab4b5ccdc9168b96791fe

source=(
    "v2raya.service"
    "v2raya-lite.service"
    "v2raya.png"
    "v2raya.desktop"
)

source_i686=(
    "v2raya_${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_x86_${pkgver}"
)
source_x86_64=(
    "v2raya_${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_x64_${pkgver}"
)
source_aarch64=(
    "v2raya_${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm64_${pkgver}"
)
source_armv6h=(
    "v2raya_${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm_${pkgver}"
)
source_armv7h=(
    "v2raya_${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm_${pkgver}"
)

sha1sums=(
    "$sha_service"
    "$sha_service_lite"
    "$sha_png"
    "$sha_desktop"
)

sha1sums_i686=(
    '473e98e5637732115b14ce8d1097c84b17ec579e'
)
sha1sums_x86_64=(
    '3cb010480c1383b9443b025211174cf1ff98e105'
)
sha1sums_aarch64=(
    '49c1b7bb12009c61cc32ebd833c76c386842a386'
)
sha1sums_armv6h=(
    '14073932c7b756c1d9518502c282d5a807b48873'
)
sha1sums_armv7h=(
    '14073932c7b756c1d9518502c282d5a807b48873'
)

package() {
    cd "$srcdir"
    install -Dm 755 v2raya_"${pkgver}" "${pkgdir}"/usr/bin/v2raya
    install -Dm 644 v2raya.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm 644 v2raya.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 v2raya-lite.service -t "${pkgdir}"/usr/lib/systemd/user/
    install -Dm 644 v2raya.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/v2raya.png
}
