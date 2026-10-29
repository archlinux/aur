# Maintainer: Panda <satodu@github.com>
pkgname=bamboo-end-store-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Console-first software store for EndeavourOS and Arch (pacman, AUR, Flatpak, AppImage), Rust and Qt (prebuilt)"
arch=('x86_64')
url="https://github.com/satodu/bamboo-end-store"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'hicolor-icon-theme')
optdepends=('paru: AUR support'
            'yay: AUR support'
            'flatpak: Flatpak support'
            'libnotify: desktop notifications'
            'konsole: terminal used for installs'
            'kitty: terminal used for installs'
            'fuse2: run AppImages')
provides=('bamboo-end-store')
conflicts=('bamboo-end-store')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/bamboo-end-store-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('aea4ba3046bda660c1b329142dcef2ce8aaa19e28ae21ca09473b8c45690abab')

package() {
    cd "${srcdir}/bamboo-end-store-${pkgver}-x86_64"
    install -Dm755 bamboo-end-store "${pkgdir}/usr/bin/bamboo-end-store"
    install -Dm644 bamboo-end-store.desktop "${pkgdir}/usr/share/applications/bamboo-end-store.desktop"
    install -Dm644 bamboo-end-store.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/bamboo-end-store.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
