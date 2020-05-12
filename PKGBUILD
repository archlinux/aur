# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=0.7.0.2
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports V2Ray, SS, SSR, Trojan and Pingtunnel protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mzz2017/v2rayA"
license=('GPL')
depends=('glibc' 'v2ray')
provides=('v2raya')
conflicts=('v2raya')

sha_service=e159b1d9cd9787b7fa876c4111ac761fef052beb
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
    'd28671035047bd475df69939fdef956c403f1d82'
)
sha1sums_x86_64=(
    '5046e0501818b2d11beda31ced9ecb1703f13386'
)
sha1sums_aarch64=(
    '8ec5bf37a0b22a55f0e871c2fa7cdf4796a2855e'
)
sha1sums_armv6h=(
    '19dc13454d2f740102ecb743135a89c7d28713cc'
)
sha1sums_armv7h=(
    '19dc13454d2f740102ecb743135a89c7d28713cc'
)

package() {
    cd "$srcdir"
    
    install -Dm644 "v2raya.service" "$pkgdir/usr/lib/systemd/system/v2raya.service"
    install -Dm755 "v2raya_v${pkgver}" "$pkgdir/usr/bin/v2raya"

    install -Dm644 "v2raya.png" "$pkgdir/usr/share/icons/v2raya.png"
    install -Dm755 "v2raya.desktop" -t "$pkgdir/usr/share/applications/"
}
