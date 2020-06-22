# Maintainer: Caleb Maclennan <caleb@alerque.com>

_font=konstruktor
pkgbase=$_font-font
pkgname=("ttf-$_font")
pkgver=1.004
pkgrel=1
pkgdesc='A narrow cousin of another constructivist typeface, Red October'
url="https://www.neogrey.com/portfolio/$_font-free-typeface"
arch=('any')
license=('custom:FFPU')
makedepends=('hq')
source=("$_font-$pkgver.zip::https://dl.dafont.com/dl/?f=${_font/-/_}"
        "font-licenses.html::https://www.neogrey.com/font-licenses")
sha256sums=('494b9309f5a98d891a206376046ffc19486fafe4044ef92a1b08b62567fa6e61'
            'SKIP')

build() {
    hq article text < font-licenses.html > FFPU.txt
}

package_ttf-konstruktor() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" FFPU.txt
}
