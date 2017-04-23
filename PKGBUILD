# Maintainer: David Manouchehri

pkgname=html2pdf
pkgdesc="An gui HTML to PDF Converter 1.0 "
url="https://code.google.com/archive/p/foxoman/"
license=('GPL3')
pkgver=1.0
pkgrel=1
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/foxoman/${pkgname}_${pkgver}-${pkgrel}_all.deb")
depends=('wkhtmltopdf' 'python2' 'python2-gobject' 'python2-notify' )
sha512sums=('e7b7903082058d7bc100b97071a51d10def4f4dd13b9d5410d1fbc73a75a91fe578e6be2fa104337f0625960162e5af7b2b030b0c0797c83e15e3965a23a4d03')
arch=('any')

package() {
	cd "${srcdir}/"
	ar x "${pkgname}_${pkgver}-${pkgrel}_all.deb"
	tar xvf "data.tar.gz"
	sed -i "s/^python /python2 /" "${srcdir}/usr/bin/html2pdf"
	cp -rp usr "${pkgdir}"
}

# vim:set et sw=2 sts=2 tw=80:
