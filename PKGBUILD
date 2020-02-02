# Maintainer: Vincevrp
pkgname=nerd-fonts-arimo
pkgver=2.1.0
pkgrel=1
pkgdesc="Patched font Arimo from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
makedepends=("fontconfig" "xorg-mkfontscale" "xorg-mkfontdir")
install=$pkgname.install
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Arimo.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
sha256sums=("683a1b4f33dcf20d6ceee89161786b1684a22bc7296efd5fd4c9d766ba6bf4cc"
            "d2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5")

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
