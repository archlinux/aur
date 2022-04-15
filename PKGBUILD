# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

## Developed by 케이투웹테크(주)

pkgname=libreoffice-extension-hwp2odt
pkgver=0.4.2
_extname=Hwp2Odt
_filename=${_extname}-${pkgver}.oxt
pkgrel=1
pkgdesc="LibreOffice extension that import hwp file and present in OpenDocumentText format"
arch=(any)
url="https://github.com/k2webtech/hwp2odt"
license=(custom)
sha512sums=('91ca36b459936f3614e1479f0f31f63166558bafc062078945314f02357cb7c6a67dac4404829181c621eaa3ab93c6d0ba2ae459dfe450e283a6c19920af4431')
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
