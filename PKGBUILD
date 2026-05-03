# Maintainer: harvey <harv at gmx dot de>

pkgname=linhabu
pkgver=26.1.3
pkgrel=1
pkgdesc="German Accounting Software (and more) for Linux"
arch=('x86_64' 'i686')
url="https://www.mcrichter.de/Seiten/Deutsch/Programme/HaBu/Allgemein.html"
install=linhabu.install
license=('custom')
depends=('gtk3')
options=("!strip") 
optdepends=('postgresql: for using a Postgres SQL Server instead of the builtin sqlite engine'
            'cups: for direct printing support instead of generating pdf-files')

source=('http://mcrichter.de/Media/Programme/LinHaBu.zip'
        'linhabu.desktop'
	'linhabu.install')

sha256sums=('5a0c7ed4b4e64ee3d8dd4bcdca031ea581c68018f8a115a1d90ce8b331e6d8b1'
            '0121f0accb53a4af4207abfeb3e57d8f4129bc6ed33e4c98b11dbff988fedd36'
            '7d184dafba4113c7cd9af81015701ed052ba3994bd11399fc5817a8fdc8f05f2')
				
package() {
	mkdir -p "${pkgdir}"/opt
	mkdir -p "${pkgdir}"/usr/share/applications
	cp -R "${srcdir}/Lin-HaBu" "${pkgdir}/opt/"
	cp linhabu.desktop "${pkgdir}"/usr/share/applications/
}
