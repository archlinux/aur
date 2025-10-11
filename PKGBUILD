# Maintainer: Hajos Attila <linux[dot]alucard[at]gmail[dot]com>

pkgname=nudelta-appimage
pkgver=0.9.0
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
sha256sums=('acb1bbd70a19fb33657162bd27dc9e5ea96eeab502ea165006ad959178141782'
            '80653fd97e843177280d0e5faee874ba5c68f5889c9be3e3d627de2c1a244473'
            'ea340cb8cb63bb24fba13eaf9c7466a62826e1abd1e50f04c5710718455f85f6')

package() {
    install -Dm755 "${srcdir}/nudelta-amd64.AppImage" "${pkgdir}/opt/nudelta-appimage/${_appimage}"
    install -Dm644 "${srcdir}/nudelta.desktop" "${pkgdir}/usr/share/applications/nudelta.desktop"
    install -Dm644 "${srcdir}/nudelta.png" "${pkgdir}/usr/share/pixmaps/nudelta.png"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/nudelta-appimage/${_appimage}" "${pkgdir}/usr/bin/nudelta"
}
