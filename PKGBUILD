# Maintainer: Panda <satodu@github.com>
pkgname=cachyos-store-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Modern community store for CachyOS and Arch Linux built with NativePHP"
arch=('x86_64')
url="https://github.com/satodu/panda-cachy-store"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme' 'gtk3' 'nss' 'libxcrypt-compat')
provides=('cachyos-store')
conflicts=('cachyos-store')
options=('!strip')

source=(
    "${pkgname}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/CachyOS.Store-${pkgver}.AppImage"
    "cachyos-store.desktop"
    "icon.png"
)

sha256sums=(
    '6594d0626c818e3a8c5ade84c67057471fe8684e0db619067c12d7f1ac4d7ac7'
    'SKIP'
    'SKIP'
)

package() {
    # 1. Executável
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/cachyos-store"

    # 2. Menu Desktop
    install -Dm644 "${srcdir}/cachyos-store.desktop" "${pkgdir}/usr/share/applications/cachyos-store.desktop"

    # 3. Ícone oficial do sistema
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cachyos-store.png"
}
