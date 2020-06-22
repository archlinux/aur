# Maintainer: Caleb Maclennan <caleb@alerque.com>

_font=arkitech-stencil
pkgbase=$_font-font
pkgname=("ttf-$_font")
pkgver=1.000
pkgrel=1
pkgdesc='Futuristic architectural sans font, stencil variant'
url="https://www.neogrey.com/portfolio/$_font-medium"
arch=('any')
license=('custom:FFPU')
makedepends=('hq')
source=("$_font-$pkgver.zip::https://www.neogrey.com/fonts-download/${_font/-/_}_medium.zip"
        "font-licenses.html::https://www.neogrey.com/font-licenses")
sha256sums=('b20ced0a17a7f89c73f5b8e73b931c83b2afcf7b7e99b1f41459a92f33f8ecbb'
            '361126c13cb9008eb61ad2818b478ab1c612ab30f1f9b77ac840bf49b538a48b')

prepare() {
    hq article text < font-licenses.html > FFPU.txt
}

package_ttf-arkitech-stencil() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" FFPU.txt
}
