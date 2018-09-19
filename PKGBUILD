# Maintainer: petRUShka petrushkin at yandex dot ru
# Contributor: Max Roder <maxroder@web.de>
# COntributor: Florian Wehner <florian@whnr.de>

pkgname=pdfsandwich
pkgver=0.1.7
pkgrel=1
pkgdesc="Wrapper for tesseract OCR and hocr2pdf to generate pdf files with the recognized text put behind the image (sandwich pdfs)."
url="http://sourceforge.net/projects/pdfsandwich/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('tesseract' 'exact-image' 'unpaper' 'imagemagick' 'poppler')
optdepends=('ghostscript: Ghostscript is only needed for resizing pdf pages, if the respective command line option is given.')
makedepends=('ocaml' 'gawk')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('ac315aeba2cc753fddc380e2522d0c41d65ea80372a23c2cd5371ebc239ac104ab5a5a1386378b9e026b2935a767128224f7617a5eb8f5ef9d6874cc18ef83ff')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
