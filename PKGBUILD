# Maintainer: Klaas Richel <klaas-richel@hotmail.com>
pkgname=ttf-th-tshyn
pkgver=4.0.0
pkgrel=1
pkgdesc="TH-tshyn Chinese fonts"
url="http://cheonhyeong.com/Simplified/download.html"
arch=('any')
license=('unknown')
makedepends=('grep')
source=("http://cheonhyeong.com/File/TH-Tshyn-4.0.0.7z")
sha256sums=('9490c9129b0adac8632f99c4d7a8027b9f27346dd35c303be7ec492b0db3707a')

build() {
    iconv --from-code=UTF-16 ReadMe\(English\).html | grep COPYRIGHT | cut -d' ' -f7- | cut -d\< -f1 > LICENSE
}

package() {
    install -d $pkgdir/usr/share/fonts/
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/"
}
