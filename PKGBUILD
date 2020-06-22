# Maintainer: Caleb Maclennan <caleb@alerque.com>

_font=red-october
pkgbase=$_font-font
pkgname=("ttf-$_font")
pkgver=2.000
pkgrel=1
pkgdesc='Constructivist typeface inspired by Russian propaganda posters'
url="https://www.neogrey.com/portfolio/$_font"
arch=('any')
license=('custom:FFPU')
makedepends=('hq')
source=("$_font-$pkgver.zip::https://dl.dafont.com/dl/?f=${_font/-/_}"
        "font-licenses.html::https://www.neogrey.com/font-licenses")
sha256sums=('b1a2c78630b6027444d18651eb56aa667a3babb16222e44cf06ac08489dc1157'
            'SKIP')

build() {
    hq article text < font-licenses.html > FFPU.txt
}

package_ttf-red-october() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" FFPU.txt
}
