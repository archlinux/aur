# Maintainer: Caleb Maclennan <caleb@alerque.com>

_font=arkitech-stencil
pkgbase=$_font-font
pkgname=("ttf-$_font")
pkgver=1.000
pkgrel=2
pkgdesc='Futuristic architectural sans font, stencil variant'
url="https://www.neogrey.com/portfolio/$_font-medium"
arch=(any)
license=(custom:FFPU)
makedepends=(hq)
source=("$_font-$pkgver.zip::https://www.neogrey.com/fonts-download/${_font/-/_}_medium.zip"
        'font-licenses.html::https://www.neogrey.com/font-licenses')
sha256sums=('b20ced0a17a7f89c73f5b8e73b931c83b2afcf7b7e99b1f41459a92f33f8ecbb'
            'c3be8592dc6cb4b6322c8e1bacace050b4a6a42cc6d3b77b445c0271d7d99db2')

build() {
	hq article text < font-licenses.html > FFPU.txt
}

package_ttf-arkitech-stencil() {
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" FFPU.txt
}
