# Maintainer: witt <1989161762 at qq dot com>

pkgname=jumpserver-client-bin
pkgver=3.0.7
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
sha256sums_x86_64=('a57b7adb9671f92a5e3cbb68bfe18a0de75a98337a25a9466fcabc459d95eba6')
sha256sums_aarch64=('b29602c48c1ffe11174b76d023f313f3cfcc81c64b075d9c20f7ab21221512a0')

prepare() {
    tar -Jxf data.tar.xz -C "${srcdir}"
}

package() {
    cp -r "${srcdir}/opt" "${pkgdir}/"
    cp -r "${srcdir}/usr" "${pkgdir}/"
}

