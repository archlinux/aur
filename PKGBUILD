# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.0.3
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports V2Ray, SS, SSR, Trojan and Pingtunnel protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/v2rayA/v2rayA"
license=('GPL')
depends=('glibc' 'v2ray')
provides=('v2raya')
conflicts=('v2raya')

sha_service=0249389e1b8e5a2b05f16dcde7fb57f7de37ca92
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=4d8985bfdca21a611fbb51fd02eddade4da99add
sha_web=01c5a7d5a20a61c83c55662eb6c5cb3c4a89652e

source=(
    "v2raya.service"
    "v2raya.png"
    "v2raya.desktop"
    "web_v${pkgver}.tar.gz::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/web_v${pkgver}.tar.gz"
)

source_i686=(
    "v2raya_v${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_386_v${pkgver}"
)
source_x86_64=(
    "v2raya_v${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_amd64_v${pkgver}"
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
    '02435e6ae896ba9a0b9ee3ca7fbde9feee2d7de5'
)
sha1sums_x86_64=(
    'a530ece10dd2cd01c77ba62733f198b8d73da1e0'
)
sha1sums_aarch64=(
    'cb0823c8c9fd986726dcc78061e0ddcd86e1f766'
)
sha1sums_armv6h=(
    '04289ca85fae3e5119aa939fd2d8c1c3a5b945fb'
)
sha1sums_armv7h=(
    '04289ca85fae3e5119aa939fd2d8c1c3a5b945fb'
)

package() {
    cd "$srcdir"
    
    install -Dm644 "v2raya.service" "$pkgdir/usr/lib/systemd/system/v2raya.service"
    install -Dm755 "v2raya_v${pkgver}" "$pkgdir/usr/bin/v2raya"

    install -Dm644 "v2raya.png" "$pkgdir/usr/share/icons/v2raya.png"
    install -Dm755 "v2raya.desktop" -t "$pkgdir/usr/share/applications/"

    install -d -Dm755 "web" "$pkgdir/etc/v2raya/web"
    cp -r web/* "$pkgdir/etc/v2raya/web"
}
