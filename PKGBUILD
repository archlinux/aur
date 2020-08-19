# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.0.0
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
sha_web=b7b0dc683a6a668437cfdbb5511f20448618de7b

source=(
    "v2raya.service"
    "v2raya.png"
    "v2raya.desktop"
    "web.tar.gz::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/web_v${pkgver}.tar.gz"
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
    '255934fb46303de903dfbfcf61efeb8d14ca705e'
)
sha1sums_x86_64=(
    '59e05b89e3f56118d9f0217f7b39e310f3774c0a'
)
sha1sums_aarch64=(
    'dcc50b1f1be3f8d0f85473ee1d4b03faf192689a'
)
sha1sums_armv6h=(
    '94f0a3b847161022c66f5015430c198b490fd83e'
)
sha1sums_armv7h=(
    '94f0a3b847161022c66f5015430c198b490fd83e'
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
