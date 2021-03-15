# Maintainer: tercean <cg@zknt.org>
pkgname=sengi-appimage
pkgver=1.1.1
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
sha256sums=('9c8511d909a5dc6a4a2f73819733b208be97ea59dfe7cf74eba3d0774bcf929f'
            '423ac35ec4d4b8ef8037e8daada490e87b0cab8768cab4151eb815c5ab4346a9'
            '073d82d71d8fcb30c032da2132d8fccbd4b739713f40ccc660a5130c77c73d81')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/sengi
    chmod +x "${pkgdir}/usr/bin/sengi"

    install -Dm644 "sengi.desktop"                    "${pkgdir}/usr/share/applications/sengi.desktop"
    install -Dm644 "sengi.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/sengi.png"
}
