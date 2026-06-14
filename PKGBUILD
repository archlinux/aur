# Maintainer: harvey <harv at gmx dot de>

pkgname=linhabu
pkgver=26.2.1
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

sha256sums=('b1f56797f3b0998033fa81132b44c4e641fe084b5347404674262bb271ce0ce5'
            '0121f0accb53a4af4207abfeb3e57d8f4129bc6ed33e4c98b11dbff988fedd36'
            '7d184dafba4113c7cd9af81015701ed052ba3994bd11399fc5817a8fdc8f05f2')
				
package() {
	mkdir -p "${pkgdir}"/opt
	mkdir -p "${pkgdir}"/usr/share/applications
	cp -R "${srcdir}/Lin-HaBu" "${pkgdir}/opt/"
	cp linhabu.desktop "${pkgdir}"/usr/share/applications/
}
