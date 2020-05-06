# Maintainer: jef

pkgname=nerd-fonts-mononoki
pkgver=2.1.0
pkgrel=1
pkgdesc="Patched font Mononoki from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
makedepends=("fontconfig" "xorg-mkfontscale" "xorg-mkfontdir")
install=$pkgname.install
source=("Mononoki-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Mononoki.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
sha256sums=("bc88f1350e2040cb30404e5d52daab24635f0a5b05924833bbc008eab6dd8a1c"
            "d2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5")

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
