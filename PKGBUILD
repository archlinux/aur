# Maintainer: ry2x

pkgname=hyprcrop-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="A fast, Hyprland-native screenshot tool written in Rust"
arch=('x86_64')
url="https://github.com/ry2x/hyprcrop"
license=('MIT')
depends=('slurp' 'wl-clipboard' 'hyprland' 'libnotify' 'pipewire' 'xdg-desktop-portal-hyprland')
provides=('hyprcrop')
conflicts=('hyprcrop')


source_x86_64=("hyprcrop-${pkgver}::${url}/releases/download/v${pkgver}/hyprcrop")
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
        "README-${pkgver}::${url}/raw/v${pkgver}/README.md")

sha256sums=('7730947ada4144f1f707fa00247da2dca12e3ef8cb22c9939d42f032595a5e74'
            '3d0e2f6bd62ad5e5bc8e568bad4255edf350b82114298374866748636dd84b0f')
sha256sums_x86_64=('650bd92c534a6b2f64c94b617edc4fb416c3549582e9b34eeba3c3521e2cbfd5')

package() {
    install -Dm755 "${srcdir}/hyprcrop-${pkgver}" "${pkgdir}/usr/bin/hyprcrop"
    install -Dm644 "${srcdir}/README-${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
