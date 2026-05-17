# Maintainer: shilka <shilkazx at gmail dot com>

pkgname=paseo-bin
pkgver=0.1.76
pkgrel=1
pkgdesc="Paseo, Orchestrate coding agents from your desk and your phone"
arch=("x86_64")
url="https://paseo.sh"

#source=("${pkgname}-${pkgver}-${pkgrel}-x86_64.deb::https://github.com/getpaseo/paseo/releases/download/v${pkgver}/Paseo-${pkgver}-amd64.deb")
depends=(
    gtk3
    libnotify
    libnss_nis
    libxss
    libx11
    libxtst
    xdg-utils
    at-spi2-core
    util-linux-libs
    libsecret
    libappindicator
)

source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.deb::https://github.com/getpaseo/paseo/releases/download/v${pkgver}/Paseo-${pkgver}-amd64.deb")
# source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64.deb::https://data.tdx.com.cn/kylin/com.tdx.tdxcfv_${pkgver}_arm64.deb")

sha256sums_x86_64=('8bd026b965009733ae04b1ba797757010b7078729970fadf8981dc86a859b956')
#sha256sums_aarch64=('7ab7a0fc74aca6b750acb1439478b3477a7121eadd6a66a001cd4b81d2144793')

prepare() {
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${srcdir}"

}
package() {
    cd $srcdir
    cp -rf opt $pkgdir/
    cp -rf usr $pkgdir/

}
