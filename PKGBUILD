# Maintainer: witt <1989161762 at qq dot com>

pkgname=jumpserver-client-bin
pkgver=3.0.6
pkgrel=1
pkgdesc="JumpServer linux Client."
arch=("x86_64" "aarch64")
url="https://www.jumpserver.com"
license=("custom")
options=('!strip')
provides=('jumpserver-client')
conflicts=('jumpserver-client')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/jumpserver/clients/releases/download/v${pkgver}/JumpServer-Client-Installer-linux-v${pkgver}-amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/jumpserver/clients/releases/download/v${pkgver}/JumpServer-Client-Installer-linux-v${pkgver}-arm64.deb")
sha256sums_x86_64=('ef039b4eeeda3e7092d7f94067568c3dc0c0bb4c386f2f233d6783713ce59c01')
sha256sums_aarch64=('0fc089a954fdcff31871e19b1dff188af2711da81586c9a67f7dc97e428c76e4')

prepare() {
    tar -Jxf data.tar.xz -C "${srcdir}"
}

package() {
    cp -r "${srcdir}/opt" "${pkgdir}/"
    cp -r "${srcdir}/usr" "${pkgdir}/"
}

