# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.2.0
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan and Pingtunnel protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/v2rayA/v2rayA"
license=('GPL3')
depends=('glibc' 'v2ray')
provides=('v2raya')
conflicts=('v2raya')

sha_service=0249389e1b8e5a2b05f16dcde7fb57f7de37ca92
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=f4abf270b2ce588a4e8ab4b5ccdc9168b96791fe
sha_web=e3e0a22aae664871c04b191699a5b36cc6ac066f

source=(
    "v2raya.service"
    "v2raya.png"
    "v2raya.desktop"
    "web_v${pkgver}.tar.gz::https://raw.fastgit.org/v2rayA/v2raya-apt/master/pool/main/v/v2raya/web_v${pkgver}.tar.gz"
)

source_i686=(
    "v2raya_v${pkgver}::https://raw.fastgit.org/v2rayA/v2raya-apt/master/pool/main/v/v2raya/v2raya_linux_386_v${pkgver}"
)
source_x86_64=(
    "v2raya_v${pkgver}::https://raw.fastgit.org/v2rayA/v2raya-apt/master/pool/main/v/v2raya/v2raya_linux_amd64_v${pkgver}"
)
source_aarch64=(
    "v2raya_v${pkgver}::https://raw.fastgit.org/v2rayA/v2raya-apt/master/pool/main/v/v2raya/v2raya_linux_arm64_v${pkgver}"
)
source_armv6h=(
    "v2raya_v${pkgver}::https://raw.fastgit.org/v2rayA/v2raya-apt/master/pool/main/v/v2raya/v2raya_linux_arm_v${pkgver}"
)
source_armv7h=(
    "v2raya_v${pkgver}::https://raw.fastgit.org/v2rayA/v2raya-apt/master/pool/main/v/v2raya/v2raya_linux_arm_v${pkgver}"
)

sha1sums=(
    "$sha_service"
    "$sha_png"
    "$sha_desktop"
    "$sha_web"
)

sha1sums_i686=(
    '0d207a83876f437b179d1dcb35e634fa30402309'
)
sha1sums_x86_64=(
    '034e37def387551ed84131c9bcabd698f5732393'
)
sha1sums_aarch64=(
    '3ffc9f073145e9208f5b10e6d3ceecbdc67d415c'
)
sha1sums_armv6h=(
    '55d56b65d4bd44b470ec4b38994eecacec65113b'
)
sha1sums_armv7h=(
    '55d56b65d4bd44b470ec4b38994eecacec65113b'
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
