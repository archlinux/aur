# Maintainer: Wael Amrani Zerrifi <waelaz1983@gmail.com>

pkgname=pacterm-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="A terminal pacman game by Wael (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/Wael-MA/pacterm"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
provides=('pacterm')
conflicts=('pacterm' 'pacterm-git')
source=("pacterm-${pkgver}::$url/releases/download/v${pkgver}/pacterm"
        "pacterm.desktop"
        "PacTermIcon.png::$url/raw/main/img/PacTermIcon.png")
sha256sums=('16556619d80d5aa4a27815ca5da6cef26a8378a3ff88c09c07969e50cac18294'
            '8aba3bab75da0890862cfcefc0742cb27ffca4673a6fe812c72cd13dd79f136e'
            '7bbb0a52c7080a125036a2e4c09733f0dda578dda91a19a1afc95e5262add195')

package() {
    install -Dm755 "${srcdir}/pacterm-${pkgver}" "${pkgdir}/usr/bin/pacterm"
    install -Dm644 "${srcdir}/pacterm.desktop" "${pkgdir}/usr/share/applications/pacterm.desktop"
    install -Dm644 "${srcdir}/PacTermIcon.png" "${pkgdir}/usr/share/pixmaps/pacterm.png"
}
