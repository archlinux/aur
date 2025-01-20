# Maintainer: Cyberczy <czysheep@gmail.com>

pkgname=ttf-maple-beta
pkgver="7.0_beta35"
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
sha256sums=('c13db95b1dc7a750431ef5df4cf98b1725c8aa104915be374a86515925459c44'
            'a29d1daa63263b397f810931ddb8de87f384198d5c7d853b0d69a422b2e77d88'
            '3a0f1da536bf046579e2b2b04a106e7bddce58dcc44a712425c70083dcaa6a2e'
            'cdb01cb2c0ac2d618ad3fc082275cf3cbe6145a58d558709ec083ce69c702cf0')

package() {
    install -d "${pkgdir}/usr/share/fonts/$pkgname"
    install -d "${pkgdir}/usr/share/licenses/$pkgname/"
    install -Dm0644 "${srcdir}/MapleMono-"*".ttf" "${pkgdir}/usr/share/fonts/$pkgname/"
    install -Dm0644 "$pkgname-LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/"
}
