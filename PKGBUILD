# Maintainer: mzz2017 <mzz@tuta.io>

pkgname=v2raya-bin
_pkgname=v2raya
pkgver=2.4.17
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

sha256sums_i686=('52cf78402ac9e29037efdc579281ddf6c9d2afbd826de47d4d8b9a45cf8a479c')
sha256sums_x86_64=('c59db409b7a4d6e350b8525359f37ea427ee838df9b6fd63856c582091030417')
sha256sums_armv7h=('f298b63bd60a21888d738bc6f81f2881410b0e15ab5eed6f7132e3ce00d2988a')
sha256sums_aarch64=('7cf6d17bf7383c73ea257ac5f1a951a2f81ec11dc89b2eb3d186fe9a03ccf82b')
sha256sums_loong64=('4faf927a6b782bf3205f3c891e592c07a6c795ab0938027efecdb82c556c3bbd')

package() {
    depends+=('v2ray-domain-list-community' 'v2ray-geoip')

    cp -a "${srcdir}"/etc "${srcdir}"/usr "${pkgdir}"/
    rm -rf "${pkgdir}"/usr/share/v2raya/*
    ln -sf /usr/share/v2ray/geoip.dat "${pkgdir}"/usr/share/v2raya/geoip.dat
    ln -sf /usr/share/v2ray/geosite.dat "${pkgdir}"/usr/share/v2raya/geosite.dat
}
