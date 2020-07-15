# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=0.7.1.2
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports V2Ray, SS, SSR, Trojan and Pingtunnel protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mzz2017/v2rayA"
license=('GPL')
depends=('glibc' 'v2ray')
provides=('v2raya')
conflicts=('v2raya')

sha_service=75c7aa49017ac8573bd18b8c01e7529b0a20cdcc
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=9df77b489c86a212923edbc2092c1c7f49596a58

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
    'b38c0e881a0a01601c0baec3756144b46ad5600d'
)
sha1sums_x86_64=(
    'e94af98d7954e644ab249dd5f5c88311facc17b1'
)
sha1sums_aarch64=(
    '77ad99f0efda0aad2826a33aa6371c694f395356'
)
sha1sums_armv6h=(
    'c213007b14c6bd949240f40ad64c8519f15ea633'
)
sha1sums_armv7h=(
    'c213007b14c6bd949240f40ad64c8519f15ea633'
)

package() {
    cd "$srcdir"
    
    install -Dm644 "v2raya.service" "$pkgdir/usr/lib/systemd/system/v2raya.service"
    install -Dm755 "v2raya_v${pkgver}" "$pkgdir/usr/bin/v2raya"

    install -Dm644 "v2raya.png" "$pkgdir/usr/share/icons/v2raya.png"
    install -Dm755 "v2raya.desktop" -t "$pkgdir/usr/share/applications/"
}
