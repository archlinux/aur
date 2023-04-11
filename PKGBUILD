# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

## Developed by 케이투웹테크(주)

pkgname=libreoffice-extension-hwp2odt
pkgver=0.4.6
pkgrel=2
pkgdesc="LibreOffice extension that import hwp file and present in OpenDocumentText format"
_extname=Hwp2Odt
_filename=${_extname}-${pkgver}.oxt
arch=(any)
url="https://github.com/k2webtech/hwp2odt"
license=(custom)
sha512sums=('cf2672ea7aebc24cf92680b012ca6035d5d3e093a94e994c52861c2b99212fd270200dfcf0bbf1693a99d89a897ee7e9ebed7ec0e5c5458ec1662506f12bbe47')
# About license, please check this https://github.com/k2webtech/hwp2odt/issues/1
depends=(libreoffice)
groups=('libreoffice-extensions')
source=("${_filename}::https://github.com/k2webtech/hwp2odt/releases/download/v${pkgver}/${_extname}.oxt")
conflicts=('libreoffice-extension-h2orestart')
noextract=("${_filename}")
package() {
	_DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/"
	install -dm755 "${_DESTDIR}"
	bsdtar -xf ${_filename} -C "${_DESTDIR}"
	chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
