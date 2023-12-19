# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=libreoffice-extension-h2orestart
pkgver=0.5.9
pkgrel=1
pkgdesc="LibreOffice extension that import hwp and hwpx file and present in OpenDocumentText format"
_extname=H2Orestart
_filename=${_extname}-${pkgver}.oxt
arch=(any)
url="https://github.com/ebandal/H2Orestart"
license=(MIT)
sha512sums=('badaa5fff4f021dbf8db9aa3db1f23ee2ec0239a773a13fdaaf4d1ee78b890c333c3e7d34e4a047df9c53f06988adaa4d55001714e2c5abf64a313d1dfdb52af')

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
