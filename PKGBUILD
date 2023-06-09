# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=zaman
pkgver=1.2.2
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
sha256sums=('b040ff5b84d3fd19391636815ad4b421b517b7c5995f35c30ecf0ba627d20b2d')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
