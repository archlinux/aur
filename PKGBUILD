# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=2.5.5
pkgrel=1
pkgdesc="A web GUI client of Project V which supports VMess, VLESS, Shadowsocks, Trojan, TUIC, Juicity and AnyTLSs"
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'loong64')
url="https://github.com/v2rayA/v2rayA"
license=('AGPL3')
provides=('v2raya')
conflicts=('v2raya')
backup=("etc/default/v2raya")

source_i686=(
    "installer_archlinux_x86_${pkgver}.pkg.tar.zst::https://github.com/v2rayA/v2rayA/releases/download/v${pkgver}/installer_archlinux_x86_${pkgver}.pkg.tar.zst"
)
source_x86_64=(
    "installer_archlinux_x64_${pkgver}.pkg.tar.zst::https://github.com/v2rayA/v2rayA/releases/download/v${pkgver}/installer_archlinux_x64_${pkgver}.pkg.tar.zst"
)
source_armv7h=(
    "installer_archlinux_armv7_${pkgver}.pkg.tar.zst::https://github.com/v2rayA/v2rayA/releases/download/v${pkgver}/installer_archlinux_armv7_${pkgver}.pkg.tar.zst"
)
source_aarch64=(
    "installer_archlinux_arm64_${pkgver}.pkg.tar.zst::https://github.com/v2rayA/v2rayA/releases/download/v${pkgver}/installer_archlinux_arm64_${pkgver}.pkg.tar.zst"
)
source_loong64=(
    "installer_archlinux_loongarch64_${pkgver}.pkg.tar.zst::https://github.com/v2rayA/v2rayA/releases/download/v${pkgver}/installer_archlinux_loongarch64_${pkgver}.pkg.tar.zst"
)

sha256sums_i686=('cb22c5a4658119a37a467ae6646f2983b8063ec68f7fe69050c5076659bcc314')
sha256sums_x86_64=('e0e18c812523cdaa12c3a8ed1200ec1e4c7326ee13beba3fd98a397df1ce9bf7')
sha256sums_armv7h=('dc1189ec109f00bdf95780c860b01bcc3a2ee876a67c25f535ad7aa66038fbd5')
sha256sums_aarch64=('8113619af0c4dd50ee77e44b83c4111dc18b379e288d863e625876ded393d169')
sha256sums_loong64=('f8ce700ea921cc555d021a751a0ffecc2f3698c09bd3d8c22f7b3683a9a4995d')

package() {
    depends+=('v2ray-domain-list-community' 'v2ray-geoip')

    cp -a "${srcdir}"/etc "${srcdir}"/usr "${pkgdir}"/
    rm -rf "${pkgdir}"/usr/share/v2raya/*
    ln -sf /usr/share/v2ray/geoip.dat "${pkgdir}"/usr/share/v2raya/geoip.dat
    ln -sf /usr/share/v2ray/geosite.dat "${pkgdir}"/usr/share/v2raya/geosite.dat
}
