# Maintainer: tercean <cg@zknt.org>
pkgname=sengi-appimage
pkgver=0.16.2
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
    'a2fc5d58ed1d4fbd203b0ec8dd6a8d5b754e20afa91d90ebf89592aa34959ba8'
    'SKIP'
    'SKIP'
    )

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/sengi
    chmod +x "${pkgdir}/usr/bin/sengi"

    install -Dm644 "sengi.desktop"                    "${pkgdir}/usr/share/applications/sengi.desktop"
    install -Dm644 "sengi.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/sengi.png" 
}
