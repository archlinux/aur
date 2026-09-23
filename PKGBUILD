# Maintainer: yumi

pkgname=flatline-bin
pkgver=1.10.9
pkgrel=1
pkgdesc="Flatline (AppImage)"
arch=('x86_64')
url="https://builds.elektroline.cz"
license=('MIT')
depends=()
provides=()
conflicts=()
options=(!strip)

_appimage="flatline-${pkgver}-stable-x86_64.AppImage"

source=(
    "${_appimage}::https://builds.elektroline.cz/Builds?app=Flatline&branch=Stable&version=Linux&filename=${_appimage}&handler=Download"
    "flatline.png"
    "flatline.desktop"
)

sha256sums=('2b23510e98ad5e26ae71776aa7c0a8639c482b4cda48223964213d53118ebf2b'
            '90d9262ee60d4b379358561e2d4c122006b4b9f2dc2c5f5f6e5db83ac762ad9f'
            'b69da04d334e859a0918a839012cb72449794470ad249462471f9720c0e5a6b0')

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" \
        "${pkgdir}/usr/bin/flatline"

    install -Dm644 "${srcdir}/flatline.png" \
        "${pkgdir}/usr/share/pixmaps/flatline.png"

    install -Dm644 "${srcdir}/flatline.desktop" \
        "${pkgdir}/usr/share/applications/flatline.desktop"
}


