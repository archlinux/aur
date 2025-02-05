# Maintainer: Stezkoy

_my_pkg=myoffice-standard-home-edition
pkgname=${_my_pkg}-bin
pkgver=3.2.139
_pkgver=3.2-139
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

source=("https://preset.myoffice-app.ru/${_my_pkg}_${_pkgver}_amd64.deb")
sha256sums=('9fbc1b752682fe5a6f7d3a524de763925f6fc549d218c0ca864eeebac85eb299')

package(){
	tar xzf data.tar.gz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/${_my_pkg}/Resources/UI/ru/LicenseAgreements.rcc" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
