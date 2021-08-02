# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.4.2
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

sha_service=ba580b203c1971780d2721a48fbc828d11467d5a
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=f4abf270b2ce588a4e8ab4b5ccdc9168b96791fe
sha_web=17e467b8bdd328d781f00e3e51e4e6628c02a2eb

source=(
    "v2raya.service"
    "v2raya.png"
    "v2raya.desktop"
    "web_v${pkgver}.tar.gz::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/web_v${pkgver}.tar.gz"
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
    "$sha_png"
    "$sha_desktop"
    "$sha_web"
)

sha1sums_i686=(
    '0f4a1c26a65ed0b4455a929fad772a05df8beb8d'
)
sha1sums_x86_64=(
    '15e68f9c073ed01c60e3d677348a90bb372e54d4'
)
sha1sums_aarch64=(
    '4969ce4ba6240ed72008f379f4edaf3581dda763'
)
sha1sums_armv6h=(
    '493dfdc8a85c112e5aa5cb6186bc12f942cd9c0b'
)
sha1sums_armv7h=(
    '493dfdc8a85c112e5aa5cb6186bc12f942cd9c0b'
)

package() {
    cd "$srcdir"
    install -Dm 755 v2raya_v"${pkgver}" "${pkgdir}"/usr/bin/v2raya
    find web -type d -exec install -vd "${pkgdir}"/etc/v2raya/{} \;
    find web -type f -exec install -vm 644 {} "${pkgdir}"/etc/v2raya/{} \;
    install -Dm 644 v2raya.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm 644 v2raya.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 v2raya.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/v2raya.png
}
