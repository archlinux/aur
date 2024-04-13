# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=zaman
pkgver=1.2.3
pkgrel=1
pkgdesc="A simple cli tool that prints (or saves) man pages in a PDF file for an easier reading"
arch=('any')
url="https://github.com/Antiz96/zaman"
license=('GPL-3.0-or-later')
depends=('man-db' 'zathura')
optdepends=('zathura-pdf-poppler: PDF support for zathura using the poppler engine'
	    'zathura-pdf-mupdf: PDF support for zathura using the MuPDF backend'
	    'rofi: Rofi support'
	    'dmenu: Dmenu support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('457d61e0437615f7b823e7ac61a4e77b343363fa67ef97045317c5bd64b404f1')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
