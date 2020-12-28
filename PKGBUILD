# Maintainer: tercean <cg@zknt.org>
pkgname=sengi-appimage
pkgver=1.0.0
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
sha256sums=('1126623b2da8a0570fcffe9c5abfd511bf12a62cb58796936124f4445a6581fe'
            '3a8ee87a4d93e61c64fcdb301a842e5284898c52600a2669afd823a4006cfc86'
            '073d82d71d8fcb30c032da2132d8fccbd4b739713f40ccc660a5130c77c73d81')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/sengi
    chmod +x "${pkgdir}/usr/bin/sengi"

    install -Dm644 "sengi.desktop"                    "${pkgdir}/usr/share/applications/sengi.desktop"
    install -Dm644 "sengi.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/sengi.png"
}
