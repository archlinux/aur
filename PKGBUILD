# Maintainer: Hajos Attila <linux.alucard@gmail.com>

pkgname=nudelta-appimage
pkgver=0.8.0
pkgrel=1
pkgdesc="Open source NuPhy Console alternative"
arch=(x86_64)
url="https://github.com/donn/nudelta"
license=("GPL3")
conflicts=('nudelta')
options=(!strip)
_appimage="nudelta-amd64.AppImage"
source=("${_appimage}::https://github.com/donn/nudelta/releases/download/${pkgver}/nudelta-amd64.AppImage"
        "nudelta.desktop"
        "nudelta.png")
sha512sums=('1ec6f6872ba71674aad131926818befc32935faff98161be10f554a38ea33335b0205c5d99dd53b09cf0638c00da13ea18b4e912e988c0c1ab62ae8a8833eb7b'
            '8b1e35e8bb50f654c6c27cdcf4c3722d22b646a47a7ad5c38dc7784b19627acee136ae574d5be52578e86415a2a6f1ac0a9bcfc82fa7913f279d58f0827eb706'
            '07c37f9c4bbf6670f8762e624ce96bc987215d9c18c0e49637a1d431956ada86f63e048791d705a39060f43853d6dfe80471462b51e54d6722b38701891071c4')

package() {
    install -Dm755 "${srcdir}/nudelta-amd64.AppImage" "${pkgdir}/opt/nudelta-appimage/${_appimage}"
    install -Dm644 "${srcdir}/nudelta.desktop" "${pkgdir}/usr/share/applications/nudelta.desktop"
    install -Dm644 "${srcdir}/nudelta.png" "${pkgdir}/usr/share/pixmaps/nudelta.png"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/nudelta-appimage/${_appimage}" "${pkgdir}/usr/bin/nudelta"
}
