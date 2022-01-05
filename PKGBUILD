# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

## Developed by 케이투웹테크(주)

pkgname=libreoffice-extension-hwp2odt
_extname=hwp2odt
pkgver=0.3.6
pkgrel=1
pkgdesc="LibreOffice extension that import hwp file and present in OpenDocumentText format"
arch=(any)
url="https://github.com/k2webtech/hwp2odt"
license=(custom)
# About license, please check this https://github.com/k2webtech/hwp2odt/issues/1
depends=(libreoffice)
groups=('libreoffice-extensions')
source=("${_extname}.oxt::https://github.com/k2webtech/hwp2odt/raw/main/Hwp2Odt.oxt")
noextract=("${_extname}.oxt")
sha512sums=('f64ff8787e5be22f39e5da490b104dface670e2042405aeaf1e2adf48bbe917f121d198be51b09f95f54522b9ac3e27f3edf2555d9bf897a4abba3a628c377da')

package() {
	_DESTDIR="${pkgdir}/usr/lib/libreoffice/share/extensions/${_extname}/"
	install -dm755 "${_DESTDIR}"
	bsdtar -xf ${_extname}.oxt -C "${_DESTDIR}"
	chmod -R a=r,a+X,u+w "${_DESTDIR}"
}
