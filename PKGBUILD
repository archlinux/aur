# Maintainer: ry2x

pkgname=hyprcrop-bin
pkgver=0.4.5
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
            'e0c9f154591de01d9cab1549f4e79fd5dd76b3a94f800e7e8f976134c031ac40')
sha256sums_x86_64=('ca1203403b30878bfb65a77e7aad3421818fa0925e4874f4c88208e67fa7daf7')

package() {
    install -Dm755 "${srcdir}/hyprcrop-${pkgver}" "${pkgdir}/usr/bin/hyprcrop"
    install -Dm644 "${srcdir}/README-${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
