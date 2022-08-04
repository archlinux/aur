# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.5.9.1698.1
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
sha_service_lite=2f3305f5ebd91dbe0ff3d70370f22a0131077794
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=f4abf270b2ce588a4e8ab4b5ccdc9168b96791fe

source=(
    "v2raya.service"
    "v2raya-lite.service"
    "v2raya.png"
    "v2raya.desktop"
)

source_i686=(
    "v2raya_${pkgver}::https://apt.v2raya.org/pool/main/v/v2raya/v2raya_linux_x86_${pkgver}"
)
source_x86_64=(
    "v2raya_${pkgver}::https://apt.v2raya.org/pool/main/v/v2raya/v2raya_linux_x64_${pkgver}"
)
source_aarch64=(
    "v2raya_${pkgver}::https://apt.v2raya.org/pool/main/v/v2raya/v2raya_linux_arm64_${pkgver}"
)
source_armv6h=(
    "v2raya_${pkgver}::https://apt.v2raya.org/pool/main/v/v2raya/v2raya_linux_arm_${pkgver}"
)
source_armv7h=(
    "v2raya_${pkgver}::https://apt.v2raya.org/pool/main/v/v2raya/v2raya_linux_arm_${pkgver}"
)

sha1sums=(
    "$sha_service"
    "$sha_service_lite"
    "$sha_png"
    "$sha_desktop"
)

sha1sums_i686=(
    '4c647fb36753a3281d2187cb6d2bf0b05579a4ed'
)
sha1sums_x86_64=(
    'c9f4a49965feb1f936325f516d47a055b2bfb8bc'
)
sha1sums_aarch64=(
    '8214014ccc992ecf5ccdd962190ecece03797267'
)
sha1sums_armv6h=(
    '1f6d7e011a612147eab7f505c022e37a59e1763d'
)
sha1sums_armv7h=(
    '1f6d7e011a612147eab7f505c022e37a59e1763d'
)

package() {
    cd "$srcdir"
    install -Dm 755 v2raya_"${pkgver}" "${pkgdir}"/usr/bin/v2raya
    install -Dm 644 v2raya.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm 644 v2raya.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 v2raya-lite.service -t "${pkgdir}"/usr/lib/systemd/user/
    install -Dm 644 v2raya.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/v2raya.png
}
