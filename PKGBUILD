# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.5.6
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan and Pingtunnel protocols"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/v2rayA/v2rayA"
license=('AGPL3')
depends=('glibc')
optdepends=('v2ray>=4.37.0-1' 'xray>=1.4.2-1')
provides=('v2raya')
conflicts=('v2raya')

sha_service=6dbb90226662fd1d2312db7650a8aea313c60448
sha_service_at=c7aea13ed7e22f43e420bc51821f5ffc93a919b1
sha_png=5c51b3e670733d6d1cf22e1cb5fe45305f4b8014
sha_desktop=f4abf270b2ce588a4e8ab4b5ccdc9168b96791fe

source=(
    "v2raya.service"
    "v2raya@.service"
    "v2raya.png"
    "v2raya.desktop"
)

source_i686=(
    "v2raya_${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_x86_${pkgver}"
)
source_x86_64=(
    "v2raya_${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_x64_${pkgver}"
)
source_aarch64=(
    "v2raya_${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm64_${pkgver}"
)
source_armv6h=(
    "v2raya_${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm_${pkgver}"
)
source_armv7h=(
    "v2raya_${pkgver}::https://apt.v2raya.mzz.pub/pool/main/v/v2raya/v2raya_linux_arm_${pkgver}"
)

sha1sums=(
    "$sha_service"
    "$sha_service_at"
    "$sha_png"
    "$sha_desktop"
)

sha1sums_i686=(
    '15ec87f962d118fa7269e9a323759827ad72df2d'
)
sha1sums_x86_64=(
    'cd022d4e2e3d39994b34c6c57471647aed300bb9'
)
sha1sums_aarch64=(
    '44d87465a2a7cef470d4eea9fe14b6a0722d3ea0'
)
sha1sums_armv6h=(
    'e083510ee4ad64d9e2d1289fd871f9bfb0f291da'
)
sha1sums_armv7h=(
    'e083510ee4ad64d9e2d1289fd871f9bfb0f291da'
)

package() {
    cd "$srcdir"
    install -Dm 755 v2raya_"${pkgver}" "${pkgdir}"/usr/bin/v2raya
    install -Dm 644 v2raya.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm 644 v2raya.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 v2raya@.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 v2raya.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/v2raya.png
}
