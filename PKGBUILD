# Maintainer: tercean <cg@zknt.org>
pkgname=sengi-appimage
pkgver=0.33.0
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
sha256sums=('7a6f9b26283d8b607743a1f6c522988e98d922d154c371f1a472dd5a919aeb3e'
            '25c3a97598b940dd27c67917bf5acf9790bef51588297f495a1ca095cfc1d6c8'
            '073d82d71d8fcb30c032da2132d8fccbd4b739713f40ccc660a5130c77c73d81')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/sengi
    chmod +x "${pkgdir}/usr/bin/sengi"

    install -Dm644 "sengi.desktop"                    "${pkgdir}/usr/share/applications/sengi.desktop"
    install -Dm644 "sengi.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/sengi.png"
}
