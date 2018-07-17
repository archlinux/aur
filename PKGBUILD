# Maintainer: cha.pa

pkgname=nerd-fonts-hack
pkgver=2.0.0
pkgrel=1
pkgdesc="Patched font Hack from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
makedepends=("fontconfig" "xorg-mkfontscale" "xorg-mkfontdir")
install=$pkgname.install
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Hack.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
sha256sums=("d1147483fd0310fa6bfce6799f47654e3f435010fdc709877b15a23f090ed41c"
            "d2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5")

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
