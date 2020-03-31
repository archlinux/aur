# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=0.6.8.5
pkgrel=1
install=.INSTALL
pkgdesc="A V2Ray Linux client with web GUI, compatible with SS and SSR and supporting transparent proxy"
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
    '8de3753e8210809023b6ba952fa981c950f7cbd1'
)
sha1sums_x86_64=(
    'a7917605df1ebca91146476d33d8626e8711321e'
)
sha1sums_aarch64=(
    'b9aaa598f468df9bb2155b6e45ee365239b71b64'
)
sha1sums_armv6h=(
    '4824e7b1522aab4756715ef0fbd0868f53fb722f'
)
sha1sums_armv7h=(
    '4824e7b1522aab4756715ef0fbd0868f53fb722f'
)

package() {
    cd "$srcdir"
    
    install -Dm644 "v2raya.service" "$pkgdir/usr/lib/systemd/system/v2raya.service"
    install -Dm755 "v2raya_v${pkgver}" "$pkgdir/usr/bin/v2raya"

    install -Dm644 "v2raya.png" "$pkgdir/usr/share/icons/v2raya.png"
    install -Dm755 "v2raya.desktop" -t "$pkgdir/usr/share/applications/"
}
