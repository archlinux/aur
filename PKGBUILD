pkgname=ttf-th-tshyn
pkgver=4.1.0
pkgrel=1
pkgdesc="TH-tshyn Chinese fonts"
url="http://cheonhyeong.com/Simplified/download.html"
arch=('any')
license=('unknown')
makedepends=('grep')
source=("http://cheonhyeong.com/File/TH-Tshyn-$pkgver.7z")
sha256sums=('42a0ca3463a7aed14ad69e4976854b42bf8fa19afd4efb15202bccc6a4b17720')

build() {
    iconv --from-code=UTF-16 ReadMe\(English\).html | grep COPYRIGHT | cut -d' ' -f7- | cut -d\< -f1 > LICENSE
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
}
