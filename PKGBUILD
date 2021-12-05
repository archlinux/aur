# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=geforcenow-electron
pkgver=1.1.12
pkgrel=1
pkgdesc="Linux desktop client for GeForce NOW, using Electron"
arch=("armv7l" "i686" "x86_64")
url="https://github.com/hmlendea/${pkgname}"
license=('GPLv3')
depends=('libva')
source=("https://github.com/hmlendea/${pkgname}/releases/download/v${pkgver}/geforcenow-electron_${pkgver}_linux.zip"
        "https://raw.githubusercontent.com/hmlendea/geforcenow-electron/master/icon.png")
sha256sums=("17fcc781ccc64b457f49cfd7a1e664c6792098ef43b0b82cc87ca1a564269fd1"
            "582ad4bb073926e51d8acaa0ab81aa70a1dbe4736eda0cf130b6ae689982b7a0")

build() {
    cd ${srcdir}
    rm "${srcdir}/geforcenow-electron_${pkgver}_linux.zip"
}

package() {
    install -d "${srcdir}" "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps"

    cp -r ${srcdir}/* "${pkgdir}/opt/${pkgname}/"

    install -m644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/nvidia.png"
    install -m755 "${srcdir}/com.github.hmlendea.${pkgname}.desktop" "${pkgdir}/usr/share/applications"
}
