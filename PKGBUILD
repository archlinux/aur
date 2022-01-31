# Maintainer: mzz2017 <m@mzz.pub>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=1.5.6.1
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
    '2ac44661908c8611ed162414f9ae45962676d3d9'
)
sha1sums_x86_64=(
    '035251279e2b35e0e1c39e28cca65f69f6856263'
)
sha1sums_aarch64=(
    '2a2e8dfe837712a7e21b2ea017d55c4c6e091762'
)
sha1sums_armv6h=(
    '5a929eaf3ffb13e364f4b1e98654c8f9fc91ad9f'
)
sha1sums_armv7h=(
    '5a929eaf3ffb13e364f4b1e98654c8f9fc91ad9f'
)

package() {
    cd "$srcdir"
    install -Dm 755 v2raya_"${pkgver}" "${pkgdir}"/usr/bin/v2raya
    install -Dm 644 v2raya.desktop -t "${pkgdir}"/usr/share/applications/
    install -Dm 644 v2raya.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 v2raya@.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm 644 v2raya.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/v2raya.png
}
