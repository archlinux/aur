# Maintainer: Cyberczy <czysheep@gmail.com>

pkgname=ttf-maple-beta
pkgver="7.0_beta27"
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
sha256sums=('567adbc7f51d4decd84a656e7ada0e168efc7df8add891d0b9cbc9084c05092f'
            '48a39df40a7637ac1b7c7b4d3de8b4ab1510afd4f9c22cb650b3eeba085dd6d1'
            '6e82358c6e73858b6391b64af4b702074a6c298fba1aae3a78a5f6b4fe4078cd'
            'cdb01cb2c0ac2d618ad3fc082275cf3cbe6145a58d558709ec083ce69c702cf0')

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "${srcdir}/MapleMono-"*".ttf" "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$pkgname-LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}
