# Maintainer: Cyberczy <czysheep@gmail.com>

pkgbase="ttf-maple-beta"
pkgname=("ttf-maple-beta" "ttf-maple-beta-nf" "ttf-maple-beta-nf-cn")
pkgver="7.0_beta36"
pkgrel="3"
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font for IDE and command line"
url="https://github.com/subframe7536/maple-font"
arch=("any")
license=("OFL-1.1")
makedepends=("unzip")
conflicts=("ttf-maple")
source=("$pkgname-${pkgver//_/-}-MapleMono-TTF.zip::$url/releases/download/v${pkgver//_/-}/MapleMono-TTF.zip"
        "$pkgname-${pkgver//_/-}-MapleMono-NF.zip::$url/releases/download/v${pkgver//_/-}/MapleMono-NF.zip"
        "$pkgname-${pkgver//_/-}-MapleMono-NF-CN.zip::$url/releases/download/v${pkgver//_/-}/MapleMono-NF-CN.zip"
        "$pkgname-${pkgver//_/-}-OFL.txt::https://raw.githubusercontent.com/subframe7536/maple-font/variable/OFL.txt")
sha256sums=("2774a3ac6ab66e46bfaaea98d3cd71bff696eabcb8c103eab7fc7bae461a534c"
            "c87aa82dd2eff522db9b003a63acd857572b0f912ad9a25e6bcf28c934abb21b"
            "5b96f88dcafa7c66806dab025c2b3018c906fd292509751b7d170fbd97f3b0da"
            "SKIP")
noextract=("$pkgname-${pkgver//_/-}-MapleMono-{TTF,NF,NF-CN}.zip")
prepare() {
    mv $pkgname-${pkgver//_/-}-OFL.txt OFL.txt
    unzip "$pkgname-${pkgver//_/-}-MapleMono-TTF.zip" -d MapleMono-TTF
    unzip "$pkgname-${pkgver//_/-}-MapleMono-NF.zip" -d MapleMono-NF
    unzip "$pkgname-${pkgver//_/-}-MapleMono-NF-CN.zip" -d MapleMono-NF-CN
}
package_ttf-maple-beta() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" MapleMono-TTF/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
package_ttf-maple-beta-nf() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" MapleMono-NF/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
package_ttf-maple-beta-nf-cn() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" MapleMono-NF-CN/*.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
