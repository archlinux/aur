# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=2.4.14
pkgrel=1
install=.INSTALL
pkgdesc="A web GUI client of Project V which supports VMess, VLESS, SS, SSR, Trojan, Tuic and Juicity protocols"
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

sha256sums_i686=('69254129d6264a59a618f4e0dabde2357339151aefa3baf5e73dcc0890906cc6')
sha256sums_x86_64=('4a5b69938f8539ee762bee1bef8850d45ecfb66496939c2cd6a3ddfb54f123ba')
sha256sums_armv7h=('37b1a85376b1021e13aa6a8b6f404e619c2f3ed4ed8c4b06c8247cd67a5e587b')
sha256sums_aarch64=('c43195e95feddfb072763721f21fcb45bcdbfcc3a2cb0d7de9013c99db711cb2')
sha256sums_loong64=('a3073cdf765f23131da55c60a7c8ee82c4f839c16841ea1769fd552dd6a38dd5')

package() {
    depends+=('v2ray-domain-list-community' 'v2ray-geoip')

    cp -a "${srcdir}"/etc "${srcdir}"/usr "${pkgdir}"/
    rm -rf "${pkgdir}"/usr/share/v2raya/*
    ln -sf /usr/share/v2ray/geoip.dat "${pkgdir}"/usr/share/v2raya/geoip.dat
    ln -sf /usr/share/v2ray/geosite.dat "${pkgdir}"/usr/share/v2raya/geosite.dat
}
