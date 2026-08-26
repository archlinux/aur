# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=2.4.16
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

sha256sums_i686=('5bc4a2ad755d0a69e4bc4c426f44fa60eb8d39d7769297464f044d7eae5b4b0f')
sha256sums_x86_64=('64ce4e619424630587a756110b090e701d09789196c979e29b6199c94c947abc')
sha256sums_armv7h=('a64524ac582a058443dde7325ca6b72e27180e61df89e1fafee776512b6485c2')
sha256sums_aarch64=('0fb41122b4ec9029872ef79cea6281e0548f65bb0f473d7d6bbd5728cd275ecf')
sha256sums_loong64=('222cdfa6e98741916e6e614f2f3f5e7c29475f4049a514b7fa9a81917dd96dde')

package() {
    depends+=('v2ray-domain-list-community' 'v2ray-geoip')

    cp -a "${srcdir}"/etc "${srcdir}"/usr "${pkgdir}"/
    rm -rf "${pkgdir}"/usr/share/v2raya/*
    ln -sf /usr/share/v2ray/geoip.dat "${pkgdir}"/usr/share/v2raya/geoip.dat
    ln -sf /usr/share/v2ray/geosite.dat "${pkgdir}"/usr/share/v2raya/geosite.dat
}
