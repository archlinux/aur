# Maintainer: petRUShka petrushkin at yandex dot ru
# Contributor: Max Roder <maxroder@web.de>

pkgname=pdfsandwich
pkgver=0.1.5
pkgrel=1
pkgdesc="Wrapper for tesseract OCR and hocr2pdf to generate pdf files with the recognized text put behind the image (sandwich pdfs)."
url="http://sourceforge.net/projects/pdfsandwich/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('tesseract' 'exact-image' 'ghostscript' 'unpaper')
makedepends=('ocaml' 'gawk')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('SKIP')

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
