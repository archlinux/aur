# Maintainer: cha.pa

pkgname=nerd-fonts-hack
pkgver=2.1.0
pkgrel=4
pkgdesc="Patched font Hack from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
provides=("ttf-font-nerd=2.1.0")
source=("Hack-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Hack.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
sha256sums=("70852e59fcffbe31d401f615625bcb9ebb6af72732c2f1fe9b9d5370c2565514"
            "d2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5")

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
