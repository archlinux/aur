# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=libreoffice-extension-h2orestart
pkgver=0.7.3
pkgrel=1
pkgdesc="LibreOffice extension that import hwp and hwpx file and present in odt format"
_extname=H2Orestart
_filename=${_extname}-${pkgver}.oxt
arch=(any)
url="https://github.com/ebandal/H2Orestart"
license=(MIT)
sha512sums=('c88b4efdd3df2faec92521abe0c9474f04e544770c0e590e915a976f32e7f43372a87bb82c69999c27df851f6f8688b2e2bde0f8cd3beefc4219d4c5b045585a')

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
