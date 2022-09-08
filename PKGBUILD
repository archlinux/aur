# Maintainer: cha.pa

pkgname=nerd-fonts-hack
pkgver=2.2.2
pkgrel=1
pkgdesc="Patched font Hack from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
provides=("ttf-font-nerd=$pkgver")
source=("Hack-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Hack.zip")
sha256sums=("1f031b6d08d51f4830eacd00853dddc7fbd4ae0a05e169f2c13f3037dd3359b3")

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}
