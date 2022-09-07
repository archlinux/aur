# Maintainer: Vincevrp
# Maintainer: T.J. Townsend <tj@mrsk.me>

pkgname=nerd-fonts-arimo
pkgver=2.2.2
pkgrel=1
pkgdesc="Patched font Arimo from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
makedepends=("fontconfig" "xorg-mkfontscale" "xorg-mkfontdir")
source=("arimo-${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Arimo.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v${pkgver}/LICENSE")
sha256sums=('38d274f9fd7e0eae3298789877c9cbfa25278b445bd1053e952fe0fb74806d5c'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
