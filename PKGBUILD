# Maintainer: Twooey <twooey@rhone.dev>
pkgname=re-zoids-saga-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='Native Zoids Saga runtime with localization support (requires your own ROM)'
arch=('x86_64')
url='https://github.com/serivt/re-zoids-saga'
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'hicolor-icon-theme' 'libx11' 'libxcursor' 'libxext' 'libxi' 'libxfixes' 'libxrandr' 'libxss' 'libxtst' 'libxkbcommon' 'wayland' 'libglvnd' 'libdrm' 'mesa' 'libpulse' 'alsa-lib' 'dbus' 'systemd-libs')
optdepends=('libdecor: window decorations on Wayland'
            'pipewire: PipeWire audio backend'
            'gtk3: native file selection dialogs'
            'vulkan-icd-loader: Vulkan rendering backend')
provides=('re-zoids-saga')
conflicts=('re-zoids-saga')
options=('!strip' '!debug')
source=("https://github.com/serivt/re-zoids-saga/releases/download/v${pkgver}/re-zoids-saga-v${pkgver}-linux-${CARCH}.tar.gz"
        're-zoids-saga.desktop'
        're-zoids-saga.png::https://raw.githubusercontent.com/serivt/re-zoids-saga/f5be21c5b49e644a0687bb44e854cf68757c9a84/assets/icons/re-zoids-saga.png')
sha256sums=('dd16b09da33f223a55f8054d9595856db69b5445f58f11caf53e02736973d0de'
            '5a7b209bf9a84f9693a64b76b99e31d07f6f54d8001db4e865eccb9027cce7d1'
            'b3c5136c762bb4b3b6a1546a0355074216169c1443b94257ab99fc87016cfc07')

package() {
    install -Dm755 "re-zoids-saga-v${pkgver}/re-zoids-saga" "${pkgdir}/usr/bin/re-zoids-saga"
    install -Dm644 re-zoids-saga.desktop "${pkgdir}/usr/share/applications/re-zoids-saga.desktop"
    install -Dm644 re-zoids-saga.png "${pkgdir}/usr/share/icons/hicolor/681x681/apps/re-zoids-saga.png"
    install -Dm644 "re-zoids-saga-v${pkgver}/README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
    install -Dm644 "re-zoids-saga-v${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
