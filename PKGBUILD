# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=0.7.0.1
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports V2Ray, SS, SSR, Trojan and PingTunnel protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mzz2017/v2rayA"
license=('GPL')
depends=('glibc' 'v2ray')
provides=('v2raya')
conflicts=('v2raya')

sha_service=bd11610dcd315fc13055a2199ddceca2b7a4bbea
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=473260aef074d7950fd4ccf62e08569638f9816c

source=(
    "v2raya.service"
    "v2raya.png"
    "v2raya.desktop"
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
)

sha1sums_i686=(
    '9384d2d8d6f4296986c4234b402ff01a48d76d2f'
)
sha1sums_x86_64=(
    '2e3ae06bd31b7be7e366d7fb98e13a95aa18ce09'
)
sha1sums_aarch64=(
    '17b975bc952a2e196325fb20e22d6754c4832574'
)
sha1sums_armv6h=(
    '5cd60a01c70ca9ded69608f6c89c19530086cc18'
)
sha1sums_armv7h=(
    '5cd60a01c70ca9ded69608f6c89c19530086cc18'
)

package() {
    cd "$srcdir"
    
    install -Dm644 "v2raya.service" "$pkgdir/usr/lib/systemd/system/v2raya.service"
    install -Dm755 "v2raya_v${pkgver}" "$pkgdir/usr/bin/v2raya"

    install -Dm644 "v2raya.png" "$pkgdir/usr/share/icons/v2raya.png"
    install -Dm755 "v2raya.desktop" -t "$pkgdir/usr/share/applications/"
}
