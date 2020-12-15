# Maintainer: jef

pkgname=nerd-fonts-mononoki
pkgver=2.1.0
pkgrel=2
pkgdesc="Patched font Mononoki from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
makedepends=("fontconfig" "xorg-mkfontscale" "xorg-mkfontdir")
source=("Mononoki-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Mononoki.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
md5sums=('2937ef688b9ad1bf6a973cb63191ff7e'
         '1b95f7668f3a4440b0d404e8dc3ccd9c')
         
package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
