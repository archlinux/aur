# Maintainer: huaji2369 <3117086599@qq.com>
pkgname=ttf-codepixel
pkgver=2.2
pkgrel=1
pkgdesc="Pixel-style font for coding"
arch=('any')
url="https://github.com/MrZ626/codePixel"
license=('custom:OFL')
source=("https://github.com/MrZ626/codePixel/releases/download/v2.2/codePixel-Regular.ttf"
        "https://openfontlicense.org/documents/OFL.txt") # original repo does not have OFL license text
sha256sums=("5f27e05419ffd17d626e234ec09056b5b7c03d235a7858f2140b161b2fb59beb"
            "1d361a8f8e8ce6e68457dcd93fb56e162e6baa3bbb7e7573a290d44399f6b57e")

prepare() {
    sed -i -e '2,5d 
    s/<dates>/2024/ 
    s/<Copyright Holder>/MrZ/ 
    s/<URL|email>/1046101471@qq.com/' OFL.txt
}

package() {
    install -Dm644 codePixel-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/codePixel.ttf"
    install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
