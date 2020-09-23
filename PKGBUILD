# Maintainer: luxcem <a@luxcem.fr>

pkgname=(ttf-fantasque-sans otf-fantasque-sans)
pkgbase=fantasque-sans-font
pkgver=1.8.0
pkgrel=1
pkgdesc="A font family with a great monospaced variant for programmers."
license=("SIL OPEN FONT LICENSE Version 1.1")
arch=("any")
url="https://github.com/belluzj/fantasque-sans"
source=("https://github.com/belluzj/fantasque-sans/releases/download/v$pkgver/FantasqueSansMono-Normal.tar.gz"
        "https://github.com/belluzj/fantasque-sans/releases/download/v$pkgver/FantasqueSansMono-NoLoopK.tar.gz"
        "https://github.com/belluzj/fantasque-sans/releases/download/v$pkgver/FantasqueSansMono-LargeLineHeight.tar.gz"
        "https://github.com/belluzj/fantasque-sans/releases/download/v$pkgver/FantasqueSansMono-LargeLineHeight-NoLoopK.tar.gz")
sha256sums=("645709a54ea6fba24c926135a213d342ddb18f0f8b49f4e604b2210b73e9068a"
            "d78359c79a951a484b5b20d6d20dc237694698d65cb5e357abccfbc678e4fed8"
            "5aa995f3e5b23a39c14039fceb8436330a1c1636667ab73197b9e0ca697ade34"
            "0604700e264c57d1d734a387012ddf153a0c53b6660bd7b66374ca86090e9099")

package_ttf-fantasque-sans() {
    conflicts=(otf-fantasque-sans)
    install -d "$pkgdir/usr/share/fonts/TTF"
    install -m644 "$srcdir"/TTF/*.ttf "$pkgdir/usr/share/fonts/TTF/"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt  
}

package_otf-fantasque-sans() {
    conflicts=(ttf-fantasque-sans)
    install -d "$pkgdir/usr/share/fonts/OTF"
    install -m644 "$srcdir"/OTF/*.otf "$pkgdir/usr/share/fonts/OTF/"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
