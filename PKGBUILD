# Maintainer: Jordan Cannon <LiteracyFanatic@gmail.com>
pkgname=nerd-fonts-profont
pkgver=2.3.1
pkgrel=2
pkgdesc='Patched font ProFont from nerd-fonts library'
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/ProFont.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('76e0d6a68de99ecc40690b847c2bb93813c4992fd8697bd4e2cfaf89a58135f3'
            '1f6ad4edae6479aaace3112ede5279a23284ae54b2a34db66357aef5f64df160')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows"*".ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
