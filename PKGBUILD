# Maintainer: Tufan Kurukaya <kurukayatufan@gmail.com>
pkgname=google-antigravity-ide-bin
pkgver=2.0.3
_build=6242596486512640
pkgrel=1
pkgdesc="Google Antigravity IDE"
arch=('x86_64')
url="https://antigravity.google/"
license=('custom')
depends=(
    'gtk3'
    'nss'
    'libxss'
    'alsa-lib'
)
provides=('antigravity-ide')
conflicts=('antigravity-ide')

source=(
    "antigravity-ide-${pkgver}.tar.gz::https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_build}/linux-x64/Antigravity%20IDE.tar.gz"
    "antigravity-ide.desktop"
)

sha256sums=('00b5fd709fef02c9f81ab4edd77e8d5baf8b85842cc654fa016d7d0492cde803'
            '7aa81a9d6d718b356ad8c609c856940b239ff680b5f2606b9851845270ecc6e9')

package() {
    install -dm755 "${pkgdir}/opt/antigravity-ide"
    cp -r "${srcdir}/Antigravity IDE/"* "${pkgdir}/opt/antigravity-ide/"

    chmod 4755 "${pkgdir}/opt/antigravity-ide/chrome-sandbox" || true

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/antigravity-ide/antigravity-ide" "${pkgdir}/usr/bin/antigravity-ide"

    install -Dm644 \
        "${srcdir}/antigravity-ide.desktop" \
        "${pkgdir}/usr/share/applications/antigravity-ide.desktop"

    install -Dm644 \
        "${srcdir}/Antigravity IDE/resources/app/resources/linux/code.png" \
        "${pkgdir}/usr/share/pixmaps/antigravity-ide.png"
}
