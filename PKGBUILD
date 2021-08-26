# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.5.0
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan and Pingtunnel protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/v2rayA/v2rayA"
license=('GPL3')
depends=('glibc')
optdepends=('v2ray>=4.37.0-1' 'xray>=1.4.2-1')
provides=('v2raya')
conflicts=('v2raya')

sha_service=0fcd700dbd5aa409b13bff64e738e566fc996881
sha_service_at=3fd341dde6e9a9d5ea828904042f9beb6028b289
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=f4abf270b2ce588a4e8ab4b5ccdc9168b96791fe

source=(
    "v2raya.service"
    "v2raya@.service"
    "v2raya.png"
    "v2raya.desktop"
)

source_i686=(
    "v2raya_v${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_x86_v${pkgver}"
)
source_x86_64=(
    "v2raya_v${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_x64_v${pkgver}"
)
source_aarch64=(
    "v2raya_v${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm64_v${pkgver}"
)
source_armv6h=(
    "v2raya_v${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm_v${pkgver}"
)
source_armv7h=(
    "v2raya_v${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm_v${pkgver}"
)

sha1sums=(
    "$sha_service"
    "$sha_service_at"
    "$sha_png"
    "$sha_desktop"
)

sha1sums_i686=(
    '81a8b628dd1bfeda01ba68d57b3359650e12596a'
)
sha1sums_x86_64=(
    '4bec2ae30fa0c5a56bdb79b5eb55f070bdd8326f'
)
sha1sums_aarch64=(
    '6940f91bc708e0d3c333d31c38cbfe51b3c0d927'
)
sha1sums_armv6h=(
    'adf13c5e7c6dde7b91463fe5efbac8bd00d168f4'
)
sha1sums_armv7h=(
    'adf13c5e7c6dde7b91463fe5efbac8bd00d168f4'
)

package() {
    cd "$srcdir"
    install -Dm 755 v2raya_v"${pkgver}" "${pkgdir}"/usr/bin/v2raya
    install -Dm 644 v2raya.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm 644 v2raya.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 v2raya@.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 v2raya.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/v2raya.png
}
