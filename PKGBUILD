# Maintainer: dim <mlrudasill@gmail.com>
pkgname=midiplusplus-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="High-performance, un-opinionated C++ piano player and MIDI visualizer"
arch=('x86_64')
url="https://github.com/dim-ghub/MIDIPlusPlusLinux"
license=('MIT')
depends=('qt6-base' 'alsa-lib')
provides=('midiplusplus')
conflicts=('midiplusplus')
source=("MIDIPlusPlus-${pkgver}::${url}/releases/download/v${pkgver}/MIDIPlusPlus"
        "midiplusplus-${pkgver}.desktop::${url}/raw/v${pkgver}/midiplusplus.desktop"
        "icon-${pkgver}.png::${url}/raw/v${pkgver}/assets/icon.png")
sha256sums=('07f39c1093292ba5f5bf828c0ff12e7426bb3b477b7e9ce54fdf0340c040884f'
            '9911c426d4c0e83e271d2ed8e32d7b6fc0f4d729346b78d5fb981e9cc1e696e8'
            '7f75d939ed06fd2efdb949a1f1ba80265eb0a7ace45fc856cb5570efaa8265a1')

package() {
    install -Dm755 "${srcdir}/MIDIPlusPlus-${pkgver}" "${pkgdir}/usr/bin/MIDIPlusPlus"
    install -Dm644 "${srcdir}/midiplusplus-${pkgver}.desktop" "${pkgdir}/usr/share/applications/midiplusplus.desktop"
    install -Dm644 "${srcdir}/icon-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/midiplusplus.png"
}
