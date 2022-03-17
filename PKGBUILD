# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

## Developed by 케이투웹테크(주)

pkgname=libreoffice-extension-hwp2odt
pkgver=0.4.1
_extname=Hwp2Odt
_filename=${_extname}-${pkgver}.oxt
pkgrel=2
pkgdesc="LibreOffice extension that import hwp file and present in OpenDocumentText format"
arch=(any)
url="https://github.com/k2webtech/hwp2odt"
license=(custom)
sha512sums=('fd1f9e776072fa0fb0895836286db8e47cc0b14aa72b0cce26cce221b24119a84b323a98e6a5d08bfbd783b7f57d9eb702005be348c2043db1ecdc6f863949d0')
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
