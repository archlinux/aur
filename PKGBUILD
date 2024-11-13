# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=libreoffice-extension-h2orestart
pkgver=0.6.8
pkgrel=1
pkgdesc="LibreOffice extension that import hwp and hwpx file and present in odt format"
_extname=H2Orestart
_filename=${_extname}-${pkgver}.oxt
arch=(any)
url="https://github.com/ebandal/H2Orestart"
license=(MIT)
sha512sums=('35130e6c529870d1e42cabc9ae4a43623e9421e7a2278f69de8180a06102ff2e3fc26f9822d0f6983783c12482ef4690b15b73965468e93479e30a940e6c1e46')

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
