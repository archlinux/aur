# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=2.5.9
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

sha256sums_i686=('6f733741a98b78973ad10bc448db54b018f07a480efdd5586a27861ef4d7b9ad')
sha256sums_x86_64=('19ca71f5d7378cf38e4b1c68db4b6f75e6c744b7f1460fa8c886e50bcb22692a')
sha256sums_armv7h=('45386bcee14b09ec81e06f16c221760469829be57bb693d22c0779e8e8b1616c')
sha256sums_aarch64=('572c7848590d2cbbcee24d39998299ce1a80774db8f70e8b42ecb8ac619d7b3b')
sha256sums_loong64=('50319b2aac1bbd3bb6ef487308fca79405c4d2393d961490ad3bd742c9b47231')

package() {
    depends+=('v2ray-domain-list-community' 'v2ray-geoip')

    cp -a "${srcdir}"/etc "${srcdir}"/usr "${pkgdir}"/
    rm -rf "${pkgdir}"/usr/share/v2raya/*
    ln -sf /usr/share/v2ray/geoip.dat "${pkgdir}"/usr/share/v2raya/geoip.dat
    ln -sf /usr/share/v2ray/geosite.dat "${pkgdir}"/usr/share/v2raya/geosite.dat
}
