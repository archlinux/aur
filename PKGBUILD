# Maintainer: Caleb Maclennan <caleb@alerque.com>

_font=syntha
pkgbase=$_font-font
pkgname=("ttf-$_font")
pkgver=1.008
pkgrel=1
pkgdesc='A rounded display typeface inspired by vintage synthesizer abbreviations'
url="https://www.neogrey.com/portfolio/$_font"
arch=('any')
license=('custom:FFPU')
makedepends=('hq')
source=("$_font-$pkgver.zip::https://dl.dafont.com/dl/?f=${_font/-/_}"
        "font-licenses.html::https://www.neogrey.com/font-licenses")
sha256sums=('8d159c26bb3e98d186f66c1f5c02bbed93bd3c8dd7bb3dce489d1518de7442dc'
            'SKIP')

prepare() {
    hq article text < font-licenses.html > FFPU.txt
}

package_ttf-syntha() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" FFPU.txt
}
