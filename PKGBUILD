# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=zaman
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple cli tool that prints (or saves) man pages in a PDF file for an easier reading"
arch=('any')
url="https://github.com/Antiz96/zaman"
license=('GPL3')
depends=('man-db' 'zathura')
optdepends=('zathura-pdf-poppler: PDF support for zathura using the poppler engine'
	    'zathura-pdf-mupdf: PDF support for zathura using the MuPDF backend'
	    'rofi: Rofi support'
	    'dmenu: Dmenu support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b65643d2626e772e9e2ec763c70929282199ef3f721ccf8cb0285ba455329100')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
