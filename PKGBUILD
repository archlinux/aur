# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.1.3
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
sha_web=9845876eac29a5ea5ca4c874c443299080f048a4

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
    '401a39d4876876ebeba0682afee81541709cce28'
)
sha1sums_x86_64=(
    '5e715dfd80229e941efc307582e5510a9d09b6ab'
)
sha1sums_aarch64=(
    '5fc3ec065048179f10237fa650d22386a678dec8'
)
sha1sums_armv6h=(
    '96c2442995f73a5ad065f656a4155b8955575607'
)
sha1sums_armv7h=(
    '96c2442995f73a5ad065f656a4155b8955575607'
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
