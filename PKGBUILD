# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>
pkgname=v2rayxplus
pkgver=1.2.0
pkgrel=1
epoch=0
pkgdesc="v2rayXPlus"
pkgdesc="Cross-platform GUI Client for V2Ray written in Qt and Golang"
arch=("x86_64")
url="https://gitlab.com/xiayesuifeng/v2rayxplus"
license=('GPL')
groups=()
depends=("qt5-base" "iptables" "v2ray" "polkit")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=('v2rayxplus.desktop'
        'v2rayxplus.svg'
        'v2rayxplus.service'
        "${pkgname}-${pkgver}.zip::https://gitlab.com/xiayesuifeng/${pkgname}/-/jobs/artifacts/${pkgver}/download?job=run-build")
noextract=()
md5sums=('9dc2795fd51f2f0e3e1749b100e1ac2d'
         'e357d8f75b9d2577bacb8a7d2c5d184a'
         'dcda30000c17f717c6e1b9e4c82416a1'
         'aa138d4b2b2b44096ad1d083d717066c')

package() {
    install -Dm=755 "${srcdir}/build/v2rayxplus" "${pkgdir}/usr/bin/v2rayxplus"
    install -Dm=755 "${srcdir}/build/v2rayxplus-helper" "${pkgdir}/usr/bin/v2rayxplus-helper"
    install -Dm=644 "${srcdir}/v2rayxplus.desktop" "${pkgdir}/usr/share/applications/v2rayxplus.desktop"
    install -Dm=644 "${srcdir}/v2rayxplus.service" "${pkgdir}/usr/lib/systemd/system/v2rayxplus.service"
    install -Dm=644 "${srcdir}/v2rayxplus.svg" "${pkgdir}/usr/share/icons/hicolor/96x96/apps/v2rayxplus.svg"
    install -Dm=644 "${srcdir}/build/config/dbus-1/system.d/me.firerain.v2rayxplus.conf" "${pkgdir}/usr/share/dbus-1/system.d/me.firerain.v2rayxplus.conf"
    install -Dm=644 "${srcdir}/build/config/dbus-1/system-services/me.firerain.v2rayxplus.service" "${pkgdir}/usr/share/dbus-1/system-services/me.firerain.v2rayxplus.service"
    install -Dm=644 "${srcdir}/build/config/polkit-1/actions/me.firerain.v2rayxplus.policy" "${pkgdir}/usr/share/polkit-1/actions/me.firerain.v2rayxplus.policy"
}
