# Maintainer: Cyberczy <czysheep@gmail.com>

pkgname=ttf-maple-beta
pkgver="7.0_beta34"
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
sha256sums=('c4b769a008d061d00e0824202bac9071611a309578ad8286e028c1eccaf49fea'
            '957dbb224f8fbbf06f2a65b97615f979746adab386fa443a7a4292aab07e5748'
            '8a1a13c7632cda4f43109d85d2f7810093982a654a44d39e30bbefebe7cd138a'
            'cdb01cb2c0ac2d618ad3fc082275cf3cbe6145a58d558709ec083ce69c702cf0')

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "${srcdir}/MapleMono-"*".ttf" "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$pkgname-LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}
