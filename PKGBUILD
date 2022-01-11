# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

## Developed by 케이투웹테크(주)

pkgname=libreoffice-extension-hwp2odt
_extname=Hwp2Odt
pkgver=0.3.7
pkgrel=1
pkgdesc="LibreOffice extension that import hwp file and present in OpenDocumentText format"
arch=(any)
url="https://github.com/k2webtech/hwp2odt"
license=(custom)
# About license, please check this https://github.com/k2webtech/hwp2odt/issues/1
depends=(libreoffice)
groups=('libreoffice-extensions')
source=("https://github.com/k2webtech/hwp2odt/releases/download/v${pkgver}/${_extname}.oxt")
noextract=("${_extname}.oxt")
sha512sums=('75d73acb417d20181d706ced16f0dbba7a18c80737e03f71cd3b44d752c1d1169a2cd083fccd1be5ef310cab0cff98538149ef6a7e7f91340e3500d45a25ce58')

package() {
	_DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/"
	install -dm755 "${_DESTDIR}"
	bsdtar -xf ${_extname}.oxt -C "${_DESTDIR}"
	chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
