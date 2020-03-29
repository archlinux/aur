# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=0.6.8.4
pkgrel=1
install=.INSTALL
pkgdesc="V2Ray Linux client with web GUI, compatible with SS and SSR, supporting transparent proxy"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mzz2017/V2RayA"
license=('GPL')
depends=('glibc' 'v2ray')
provides=('v2raya')
conflicts=('v2raya')

sha_service=ea22c162c1fddb7ed786ab2a402d501c07280604
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=6da6dcf0b0dd3cb2567bf8d2876fd8b9be3cc442

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
    '4fa7efbab9fdb5bccda36ac49d4b32fc79e88304'
)
sha1sums_x86_64=(
    'a79d6e83093c5db885384b8ed45a3936d7953606'
)
sha1sums_aarch64=(
    '56b1bd0285a68f7d9af7aec404ac89af45c048d0'
)
sha1sums_armv6h=(
    'e31f3308770353fe1abd5ab04f1046f5189d1a14'
)
sha1sums_armv7h=(
    'e31f3308770353fe1abd5ab04f1046f5189d1a14'
)

package() {
    cd "$srcdir"
    
    install -Dm644 "v2raya.service" "$pkgdir/usr/lib/systemd/system/v2raya.service"
    install -Dm755 "v2raya_v${pkgver}" "$pkgdir/usr/bin/v2raya"

    install -Dm644 "v2raya.png" "$pkgdir/usr/share/icons/v2raya.png"
    install -Dm755 "v2raya.desktop" -t "$pkgdir/usr/share/applications/"
}
