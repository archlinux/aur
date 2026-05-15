# Maintainer: Stezkoy

_my_pkg=myoffice-standard-home-edition
pkgname=${_my_pkg}-bin
pkgver=26.1.0
pkgrel=1
pkgdesc="A set of office applications for creating text and spreadsheet documents. Home edition."
arch=('x86_64')
url="https://myoffice.ru/products/standard-home-edition/"
license=('EULA')
groups=('myoffice')
depends=('fontconfig' 'freetype2' 'glib2' 'hunspell' 'krb5' 'libcups' 'libglvnd' 'libpng' 'libpulse'
	'libx11' 'libxcb' 'libxext' 'libxkbcommon' 'libxkbcommon-x11' 'libxrender' 'link-grammar' 'lua'
	'mono' 'openssl-1.1' 'pcre2' 'pixman' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'zlib' 'bc')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source=("${_my_pkg}-${pkgver}.deb::https://preset.myoffice-app.ru/MyOfficeStandardHomeEdition.deb")
sha256sums=('91a6d5b1d0cccc3b6773148357dc0c045f6727e5fbdd2e6cad9572f336273644')

package(){
	tar xzf data.tar.gz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/${_my_pkg}/Resources/UI/ru/LicenseAgreements.rcc" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
