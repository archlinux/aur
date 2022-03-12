# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

## Developed by 케이투웹테크(주)

pkgname=libreoffice-extension-hwp2odt
_extname=Hwp2Odt
pkgver=0.4.0
pkgrel=1
pkgdesc="LibreOffice extension that import hwp file and present in OpenDocumentText format"
arch=(any)
url="https://github.com/k2webtech/hwp2odt"
license=(custom)
sha512sums=('4d4d8ee209ca34d288ad9a6c676a638002b813e3769d8a8669570595c931dcaaac4d00d3047cb87e77d196c93a78835e10527a71833c1184218b030d01da577f')
# About license, please check this https://github.com/k2webtech/hwp2odt/issues/1
depends=(libreoffice)
groups=('libreoffice-extensions')
source=("https://github.com/k2webtech/hwp2odt/releases/download/v${pkgver}/${_extname}.oxt")
noextract=("${_extname}.oxt")
package() {
	_DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/"
	install -dm755 "${_DESTDIR}"
	bsdtar -xf ${_extname}.oxt -C "${_DESTDIR}"
	chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
