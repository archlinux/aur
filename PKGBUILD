# Maintainer: Caleb Maclennan <caleb@alerque.com>

_font=ronduit-capitals
pkgbase=$_font-font
pkgname=("otf-$_font")
pkgver=1.006
pkgrel=1
pkgdesc='An elegant modular display typeface'
url="https://www.neogrey.com/portfolio/$_font-light"
arch=('any')
license=('custom:FFPU')
makedepends=('hq')
source=("$_font-$pkgver.zip::https://dl.dafont.com/dl/?f=${_font/-/_}"
        "font-licenses.html::https://www.neogrey.com/font-licenses")
sha256sums=('ea7afef3130ee85d0bbd9886e03e0e4d972438bea605780d3804c3044e0cf6fe'
            'SKIP')

prepare() {
    hq article text < font-licenses.html > FFPU.txt
}

package_otf-ronduit-capitals() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" FFPU.txt
}
