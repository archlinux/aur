# Maintainer: Jordan Cannon <LiteracyFanatic@gmail.com>
pkgname=nerd-fonts-profont
pkgver=2.3.3
pkgrel=1
pkgdesc='Patched font ProFont from nerd-fonts library'
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/ProFont.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('da9a286a4cd149ab8e42b54965821dddbf0689f5c3fa5a2cad2985cb2852783c'
            '1f6ad4edae6479aaace3112ede5279a23284ae54b2a34db66357aef5f64df160')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${srcdir}/"*"Windows"*".ttf"
    install -Dm644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
