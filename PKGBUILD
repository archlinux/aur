# Maintainer: Cyberczy <czysheep@gmail.com>

pkgname=ttf-maple-beta
pkgver="7.0_beta31"
pkgrel=1
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line"
arch=("any")
url="https://github.com/subframe7536/maple-font"
license=("OFL")
conflicts=(ttf-maple)
source=("$pkgname-${pkgver//_/-}-MapleMono-TTF.zip::$url/releases/download/v${pkgver//_/-}/MapleMono-TTF.zip"
        "$pkgname-${pkgver//_/-}-MapleMono-NF.zip::$url/releases/download/v${pkgver//_/-}/MapleMono-NF.zip"
        "$pkgname-${pkgver//_/-}-MapleMono-NF-CN.zip::$url/releases/download/v${pkgver//_/-}/MapleMono-NF-CN.zip"
        "$pkgname-LICENSE::https://raw.githubusercontent.com/subframe7536/maple-font/main/OFL.txt")
sha256sums=('a1aaa886036ef7b8445fc312ed496f877c6429b5cdf5f3f5bbbfbc3a2c67f426'
            '9f73c33908ad3505728534f074ad6358fa1c532da35f2a285c6b8c95ad3ac9c8'
            '6d5a19762f27f38347e28e55e357d9f9b380621992ce15da4f9787dfde0aeba1'
            'cdb01cb2c0ac2d618ad3fc082275cf3cbe6145a58d558709ec083ce69c702cf0')

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "${srcdir}/MapleMono-"*".ttf" "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$pkgname-LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}
