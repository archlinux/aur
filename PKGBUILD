# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

## Developed by 케이투웹테크(주)

pkgname=libreoffice-extension-hwp2odt
pkgver=0.4.5
pkgrel=1
pkgdesc="LibreOffice extension that import hwp file and present in OpenDocumentText format"
_extname=Hwp2Odt
_filename=${_extname}-${pkgver}.oxt
arch=(any)
url="https://github.com/k2webtech/hwp2odt"
license=(custom)
sha512sums=('73ad3cd9cf1ca9f351d2ef4e2a8e6d9f636a68c4773ed97d140ea23e556b93ee730d42b0b07ae2089fda6c30e618d2ea267820a2e1eb1a6503de1209f427b239')
# About license, please check this https://github.com/k2webtech/hwp2odt/issues/1
depends=(libreoffice)
groups=('libreoffice-extensions')
source=("${_filename}::https://github.com/k2webtech/hwp2odt/releases/download/v${pkgver}/${_extname}.oxt")
noextract=("${_filename}")
package() {
	_DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/"
	install -dm755 "${_DESTDIR}"
	bsdtar -xf ${_filename} -C "${_DESTDIR}"
	chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
