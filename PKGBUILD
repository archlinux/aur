# Maintainer: ry2x

pkgname=hyprcrop-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A fast, Hyprland-native screenshot tool written in Rust"
arch=('x86_64')
url="https://github.com/ry2x/hyprcrop"
license=('MIT')
depends=('slurp' 'wl-clipboard' 'hyprland' 'libnotify' 'pipewire')
provides=('hyprcrop')
conflicts=('hyprcrop')


source_x86_64=("hyprcrop-${pkgver}::${url}/releases/download/v${pkgver}/hyprcrop")
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
        "README-${pkgver}::${url}/raw/v${pkgver}/README.md")

sha256sums=('7730947ada4144f1f707fa00247da2dca12e3ef8cb22c9939d42f032595a5e74'
            '95ad33ce5a2df2f90e8f8de5a539b04ff448877f21de02a1070f555eaa9b81ed')
sha256sums_x86_64=('a989e3c6d7b17c15545bb1f5a425afb8193d816ba82cd9006db7fc342a7951d2')

package() {
    install -Dm755 "${srcdir}/hyprcrop-${pkgver}" "${pkgdir}/usr/bin/hyprcrop"
    install -Dm644 "${srcdir}/README-${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
