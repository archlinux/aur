# Maintainer: jef

pkgname=nerd-fonts-mononoki
pkgver=2.2.2
pkgrel=2
pkgdesc="Patched font Mononoki from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
makedepends=("fontconfig" "xorg-mkfontscale" "xorg-mkfontdir")
provides=('ttf-font-nerd')
source=("Mononoki-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Mononoki.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('d6d21469971ac8cf01d5c1e6a34372466d4f67a0db2e79b6fd0b4d9d6b8c9d05'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
