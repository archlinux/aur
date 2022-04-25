# Maintainer: Dawid Weglarz <dawid.weglarz95@gmail.com>

pkgname=geforcenow-electron
pkgver=1.4.0
pkgrel=1
pkgdesc="Linux desktop client for GeForce NOW, using Electron"
arch=("armv7l" "i686" "x86_64")
url="https://github.com/hmlendea/${pkgname}"
license=('GPLv3')
depends=('libva')
source=("https://github.com/hmlendea/${pkgname}/releases/download/v${pkgver}/geforcenow-electron_${pkgver}_linux.zip"
        "https://raw.githubusercontent.com/hmlendea/geforcenow-electron/master/icon.png")
sha256sums=("e47e5ebaf174beffb308b770c823818489037eadbfb22a8cddc3cf6cb3f7e013"
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
