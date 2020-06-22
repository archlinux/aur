# Maintainer: Caleb Maclennan <caleb@alerque.com>

_font=arkitech
pkgbase=$_font-font
pkgname=("ttf-$_font")
pkgver=1.005
pkgrel=1
pkgdesc='Futuristic architectural sans font'
url="https://www.neogrey.com/portfolio/$_font-2"
arch=('any')
license=('custom:FFPU')
makedepends=('hq')
source=("$_font-$pkgver.zip::https://dl.dafont.com/dl/?f=$_font"
        "font-licenses.html::https://www.neogrey.com/font-licenses")
sha256sums=('cb73fb29e4318055e3ed1db90d6d9a60a7a75985fbf6011b8e324f83e002e033'
            'SKIP')

build() {
    hq article text < font-licenses.html > FFPU.txt
}

package_ttf-arkitech() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" FFPU.txt
}
