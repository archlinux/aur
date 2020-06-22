# Maintainer: Caleb Maclennan <caleb@alerque.com>

_font=lausanne
pkgbase=$_font-font
pkgname=("otf-$_font" "ttf-$_font")
pkgver=1.005
pkgrel=1
pkgdesc='A luxury serif typeface borrowing from classic Didot with a hint of Copperplate'
url="https://www.neogrey.com/portfolio/$_font-free-font"
arch=('any')
license=('custom:FFPU')
makedepends=('hq')
source=("$_font-$pkgver.zip::https://dl.dafont.com/dl/?f=${_font/-/_}"
        "font-licenses.html::https://www.neogrey.com/font-licenses")
sha256sums=('47b9da93f9f34b596cbcf832a04bb3a2285075d9588f0133946f6e38ec3a18f5'
            'SKIP')

prepare() {
    hq article text < font-licenses.html > FFPU.txt
}

package_otf-lausanne() {
    provides=("$pkgbase")
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" FFPU.txt
}

package_ttf-lausanne() {
    provides=("$pkgbase")
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" FFPU.txt
}
