# Maintainer: harvey <harv at gmx dot de>

pkgname=linhabu
pkgver=25.0.1
pkgrel=2
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

sha256sums=('38d38f0714129c71fee708f145a4b93ccb63d33962493b9eaa4256f58a9c58e5'
            '0121f0accb53a4af4207abfeb3e57d8f4129bc6ed33e4c98b11dbff988fedd36'
	    'ca3873a5288d9087b271185cf1095a2ea8d094b51126e2d7213e6d7b01987d56')
				
package() {
	mkdir -p "${pkgdir}"/opt
	mkdir -p "${pkgdir}"/usr/share/applications
	cp -R "${srcdir}/Lin-HaBu" "${pkgdir}/opt/"
	cp linhabu.desktop "${pkgdir}"/usr/share/applications/
}
