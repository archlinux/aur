# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>

pkgname=libreoffice-extension-h2orestart
pkgver=0.6.2
pkgrel=1
pkgdesc="LibreOffice extension that import hwp and hwpx file and present in odt format"
_extname=H2Orestart
_filename=${_extname}-${pkgver}.oxt
arch=(any)
url="https://github.com/ebandal/H2Orestart"
license=(MIT)
sha512sums=('2f999451c8a3ef2230e5be2d1cb9710b6b91a8e96929b5e5771ece071d6e9cc0918fc6f6168b3cebcd4c7d5ceb88f5e3e840ce7f1415885fa12d857e5f84bf47')

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
