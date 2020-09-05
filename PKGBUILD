# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.0.1
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
sha_web=94763c1d1ad5811e72350ca2fe61ae5da4588ae3

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
    '706f023b2ac119ed696dbcb77c45a94ded1576c6'
)
sha1sums_x86_64=(
    'cb2e612f93a7e3a5eee538261bc51ddf547c7364'
)
sha1sums_aarch64=(
    '23ffef695d36808432ea8a93efb91e0e05d329b4'
)
sha1sums_armv6h=(
    'daf1e045020d6d6367582ff418a3038fe314857e'
)
sha1sums_armv7h=(
    'daf1e045020d6d6367582ff418a3038fe314857e'
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
