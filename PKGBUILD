# Maintainer: b00rt00s

pkgname=vesta
pkgver=3.4.5
pkgrel=1
pkgdesc="3D visualization program for structural models, volumetric data such as electron/nuclear densities, and crystal morphologies."
url="http://jp-minerals.org/vesta"
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2' 'libpng12' 'glu' 'desktop-file-utils' 'libxtst' 'java-environment')

_url="http://jp-minerals.org/vesta/archives/"
source_i686=("${_url}/${pkgver}/VESTA-i686.tar.bz2")
source_x86_64=("${_url}/${pkgver}/VESTA-x86_64.tar.bz2")
source=('VESTA' 'VESTA.desktop' 'vesta.install')
install="vesta.install"

md5sums=('25d5c67b4180e227aa3fe2727119a68a'
         'fdd7040720e4b58a26caa7db09669acf'
         'caabe467168af9e44cf380af1abfe280')
md5sums_i686=('57be5d5d22bcbb77c9b7f10fe2fedfe1')
md5sums_x86_64=('ed14e6a80273c9c3d90473afc2f59e42')


package() {
	#prepare dirs
	mkdir -p ${pkgdir}/opt
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses
	mkdir -p ${pkgdir}/usr/share/applications/
	
  
	cp -a ${srcdir}/VESTA-${CARCH} ${pkgdir}/opt/VESTA
	chmod 755 ${pkgdir}/opt/VESTA
	
	#install executable
		install -m 755 ${srcdir}/VESTA ${pkgdir}/usr/bin
		
	#install desktop file
	install -m 644 ${srcdir}/VESTA.desktop ${pkgdir}/usr/share/applications/

	#link licence
	(	cd ${pkgdir}/usr/share/licenses
		ln -sf ../../../../opt/VESTA/Library_License vesta
	)
}
