# Maintainer: Cyberczy <czysheep@gmail.com>

pkgbase="ttf-maple-beta"
pkgname=("ttf-maple-beta" "ttf-maple-beta-nf" "ttf-maple-beta-nf-cn")
pkgver="7.0"
pkgrel="1"
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
sha256sums=("1609689e46e7a618b09b11a3ed9d28cdf1ccc29263efef7a83a58cb4c7b7ac8a"
            "1e066422b115e73991841bc0238fee4fe9df5210da0f41fcd6ea535df24d85a0"
            "214047481216fffbd6c25ba679f156e3c79250b26663d7bc17d62685bb7f294d"
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
