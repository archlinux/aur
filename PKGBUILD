# Maintainer: Jordan Cannon <LiteracyFanatic@gmail.com>
pkgname=nerd-fonts-profont
pkgver=2.2.1
pkgrel=2
pkgdesc='Patched font ProFont from nerd-fonts library'
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/ProFont.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('60df130d56589a0d8816b060c49b774b43171bd6fbbe3c226c3aeba1f1fc703a'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows"*".ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
