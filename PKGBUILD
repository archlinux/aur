# Contributor: Anizio de Oliveira Rodrigues <aniziooliveira@bol.com.br>
# Maintainer: Davi da Silva Böger <dsboger@gmail.com>

pkgname=libreoffice-extension-vero
_pkgname=VeroptBRV320AOC
pkgver=3.2
pkgrel=1
pkgdesc="A spell checker and grammar checker for LibreOffice and OpenOffice.org - Brazilian Portuguese."
arch=('any')
url="http://pt-br.libreoffice.org/projetos/projeto-vero-verificador-ortografico/"
license=('LGPL3' 'MPL')
groups=('libreoffice-extensions')
depends=('libreoffice')
source=("https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/${_pkgname}.oxt")
md5sums=('9a9ac174c401406604bfcf101de2a7ba')
noextract=('${_pkgname}.oxt')

prepare() {
	mkdir -p "${srcdir}/${_pkgname}"
	cd "${srcdir}/${_pkgname}"
    bsdtar -xf ${srcdir}/${_pkgname}.oxt
}

package () {
	install -d "${pkgdir}/usr/lib/libreoffice/share/extensions/"
    cp -R "${srcdir}/${_pkgname}" "${pkgdir}/usr/lib/libreoffice/share/extensions/${_pkgname}"
}

