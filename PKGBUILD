# Maintainer: Louis Tim Larsen <louis(a)louis.dk>
# djdsfk

pkgname=thunderbird-appmenu-bin
pkgver=60.8.0
_build=build1.1-0ubuntu3
pkgrel=1
pkgdesc="Thunderbird with appmenu patch from Ubuntu"
arch=('x86_64')
url="https://packages.ubuntu.com/source/disco/thunderbird"
license=('MPL' 'GPL' 'LGPL')
depends=('atk>=1.12.4' 'cairo>=1.10.0' 'dbus>=1.9.14' 'dbus-glib>=0.78' 'desktop-file-utils' 'fontconfig>=2.12.6' 'freetype2>=2.2.1' 'gcc8-libs>=6' 'gdk-pixbuf2>=2.22.0' 'glib2>=2.31.8' 'gtk3>=3.4' 'hicolor-icon-theme' 'libx11' 'libxcb' 'libxcomposite>=0.3' 'libxdamage>=1.1' 'libxext' 'libxfixes' 'libxrender' 'libxt' 'startup-notification>=0.8')
optdepends=('hunspell'
            'libcanberra'
            'libdbusmenu-glib'
            'libdbusmenu-gtk3'
            'lyx')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird')
replaces=('thunderbird')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=(http://security.ubuntu.com/ubuntu/pool/main/t/thunderbird/thunderbird_${pkgver}+${_build}_amd64.deb)
sha512sums=('9c0e02783f38cba851608bbead62c0eeb710b0ca9408a4475212d356c56a424a1f454519fdc397fafa989cb48c35b7f1bf89a9f52bcf68befd2843dad6556463')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Change extensions folder location to comply with upstream Thunderbird
	rm "${pkgdir}"/usr/lib/thunderbird/extensions
	mv "${pkgdir}"/usr/lib/thunderbird-addons/extensions "${pkgdir}"/usr/lib/thunderbird/extensions
	rm -r "${pkgdir}"/usr/lib/thunderbird-addons

}
