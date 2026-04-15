# Maintainer: ry2x

pkgname=hyprcrop-bin
pkgver=0.4.4
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
            'bafc618029795659be1c0b7ddce3e1d91a8b29638d8a7f362c87fa88d9440950')
sha256sums_x86_64=('1c42558d5a4bec77147d367391b4e8ab1251a2cdf36c73a02cb56a1189fd0c06')

package() {
    install -Dm755 "${srcdir}/hyprcrop-${pkgver}" "${pkgdir}/usr/bin/hyprcrop"
    install -Dm644 "${srcdir}/README-${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
