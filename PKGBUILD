# Maintainer: cha.pa

pkgname=nerd-fonts-hack
pkgver=2.2.0
pkgrel=2
pkgdesc="Patched font Hack from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
provides=("ttf-font-nerd=2.2.0")
source=("Hack-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Hack.zip")
sha256sums=("09f9b0ad4ceec25f7bb81bed0ae10b4e3ceae08301a973104e07add17bc9df98")

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}
