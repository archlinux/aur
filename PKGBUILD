# Maintainer: tercean <cg@zknt.org>
pkgname=sengi-appimage
pkgver=0.27.0
pkgrel=1
pkgdesc='Mastodon & Pleroma Multi-account Desktop Client'
arch=('x86_64')
url='https://nicolasconstant.github.io/sengi/'
license=('AGPL')
provides=('sengi')
conflicts=('sengi')
depends=('fuse')
options=(!strip)
_appimage="Sengi-${pkgver}-linux.AppImage"
source=(
    "Sengi-${pkgver}-linux.AppImage::https://github.com/NicolasConstant/sengi/releases/download/${pkgver}/Sengi-${pkgver}-linux.AppImage"
    "sengi.desktop"
    "sengi.png"
    )
noextract=("${_appimage}")
sha256sums=(
    '1084ece34256104de38e2898c52b9d22cb3c1c0f89caeadc2e03ad44fedf4a59'
    'SKIP'
    'SKIP'
    )

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/sengi
    chmod +x "${pkgdir}/usr/bin/sengi"

    install -Dm644 "sengi.desktop"                    "${pkgdir}/usr/share/applications/sengi.desktop"
    install -Dm644 "sengi.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/sengi.png"
}
