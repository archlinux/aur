# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=libreoffice-extension-h2orestart
pkgver=0.6.1
pkgrel=1
pkgdesc="LibreOffice extension that import hwp and hwpx file and present in odt format"
_extname=H2Orestart
_filename=${_extname}-${pkgver}.oxt
arch=(any)
url="https://github.com/ebandal/H2Orestart"
license=(MIT)
sha512sums=('7195fb905aeeda8f1aa9260e7f0d59d39f9f4e872864c4bc9475ce4ea37a07470e74f4f443a78fa4ee275c744e6cfe38333a31224f1af26f2459cd35e8da84b4')

depends=('libreoffice' 'java-runtime-headless')
groups=('libreoffice-extensions')
source=("${_filename}::https://github.com/ebandal/H2Orestart/releases/download/v${pkgver}/${_extname}.oxt")
conflicts=('libreoffice-extension-hwp2odt')
noextract=("${_filename}")
package() {
	_DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/"
	install -dm755 "${_DESTDIR}"
	bsdtar -xf ${_filename} -C "${_DESTDIR}"
	chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
