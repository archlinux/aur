# Maintainer: Jordan Cannon <LiteracyFanatic@gmail.com>
pkgname=nerd-fonts-profont
pkgver=2.2.1
pkgrel=1
pkgdesc='Patched font ProFont from nerd-fonts library'
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/ProFont.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('27ff63d48396611c3051133ca5e6a8e6e0c6ccfbc1928ac7be497020f3cd6432'
            'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows"*".ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
