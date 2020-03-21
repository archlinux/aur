# Maintainer: XiaYeSuiFeng <xiayesuifeng@firerain.me>
pkgname=v2rayxplus
pkgver=1.0.0
pkgrel=1
epoch=0
pkgdesc="v2rayXPlus"
pkgdesc="Cross-platform GUI Client for V2Ray written in Qt and Golang"
arch=("x86_64")
url="https://gitlab.com/xiayesuifeng/v2rayxplus"
license=('GPL')
groups=()
depends=("qt5-base" "iptables" "v2ray")
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
        'SKIP')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/96x96/apps"
    mkdir -p "${pkgdir}/usr/lib/systemd/system"

    install -m=755 "${srcdir}/build/v2rayxplus" "${pkgdir}/usr/bin"
    install -m=644 "${srcdir}/v2rayxplus.desktop" "${pkgdir}/usr/share/applications"
    install -m=644 "${srcdir}/v2rayxplus.service" "${pkgdir}/usr/lib/systemd/system"
    install -m=644 "${srcdir}/v2rayxplus.svg" "${pkgdir}/usr/share/icons/hicolor/96x96/apps"
}
