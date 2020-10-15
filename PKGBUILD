# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.0.2
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports V2Ray, SS, SSR, Trojan and Pingtunnel protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/mzz2017/v2rayA"
license=('GPL')
depends=('glibc' 'v2ray')
provides=('v2raya')
conflicts=('v2raya')

sha_service=1dd06514fb8adf8c3dc92c3fe1040ed2dba6f1bf
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=4d8985bfdca21a611fbb51fd02eddade4da99add
sha_web=6f4683ebd31ca407afcabdea5a90224825855bbb

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
    'b2970a891beaeb04aab5c25da9260496854d5733'
)
sha1sums_x86_64=(
    '787785a7e141f56fa3fb52347220f5590011c17d'
)
sha1sums_aarch64=(
    '84f77e853f757aca544da88c51578094be1e782f'
)
sha1sums_armv6h=(
    '7a7607bc498e90741f6051ed9bad9f51d013ee2a'
)
sha1sums_armv7h=(
    '7a7607bc498e90741f6051ed9bad9f51d013ee2a'
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
