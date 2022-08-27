# Maintainer: Vincevrp
# Maintainer: T.J. Townsend <tj@mrsk.me>

pkgname=nerd-fonts-arimo
pkgver=2.2.1
pkgrel=1
pkgdesc="Patched font Arimo from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
makedepends=("fontconfig" "xorg-mkfontscale" "xorg-mkfontdir")
source=("arimo-${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Arimo.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/LICENSE")
sha256sums=('5260211447ff71778c2f38f17bbdec2c480bf75c4f2a95e391f124edfc94f105'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
