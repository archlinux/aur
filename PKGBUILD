# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

## Developed by 케이투웹테크(주)

pkgname=libreoffice-extension-hwp2odt
pkgver=0.4.4
pkgrel=1
pkgdesc="LibreOffice extension that import hwp file and present in OpenDocumentText format"
_extname=Hwp2Odt
_filename=${_extname}-${pkgver}.oxt
arch=(any)
url="https://github.com/k2webtech/hwp2odt"
license=(custom)
sha512sums=('8b1b88615ab579a0da09e032ef3b388906c1b1da8924e095aa1c1653316501e77943d53c622bd0ec2ed5f7aba1ea99c5535b8903389e11adc9b34b8f761dd757')
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
