# Maintainer: witt <1989161762 at qq dot com>

pkgname=jumpserver-client-bin
pkgver=3.0.2
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
sha256sums_x86_64=('f995cc9dfc88407b98eefc8f9c0ca330f868fcd6cdf8f425252c967a53f5bbe0')
sha256sums_aarch64=('9b5b845e07e404b046a9548ae210150e082b10faaee9505e5beeacd6757f9b96')

prepare() {
    tar -Jxf data.tar.xz -C "${srcdir}"
}

package() {
    cp -r "${srcdir}/opt" "${pkgdir}/"
    cp -r "${srcdir}/usr" "${pkgdir}/"
}

