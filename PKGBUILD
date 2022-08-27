# Maintainer: cha.pa

pkgname=nerd-fonts-hack
pkgver=2.2.1
pkgrel=1
pkgdesc="Patched font Hack from nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
provides=("ttf-font-nerd=$pkgver")
source=("Hack-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Hack.zip")
sha256sums=("742f33105dc6eff192ad9e8b3b4406580ad418910c806c51551d9bb050f25d66")

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows Compatible.ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}
