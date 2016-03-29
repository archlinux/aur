# Contributor: b00rt00s <bomby.zrzuc@gmail.com>

pkgname=vesta
pkgver=3.3.2
pkgrel=3
pkgdesc="3D visualization program for structural models, volumetric data such as electron/nuclear densities, and crystal morphologies."
url="http://jp-minerals.org/vesta"
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2' 'libpng12' 'glu' 'desktop-file-utils' 'libxtst' 'java-environment')

_url="http://www.geocities.jp/kmo_mma/crystal/download"
source_i686=("${_url}/VESTA-i686.tar.bz2")
source_x86_64=("${_url}/VESTA-x86_64.tar.bz2")
source=('VESTA' 'VESTA.desktop' 'vesta.install')

md5sums_i686=('d4704bbf015665c8d924629bdfe3f2ca')
md5sums_x86_64=('614a1d1eac36106223490300933f511a')
md5sums=('8de33bd748dc36059dc7684109c03a4c' 'fdd7040720e4b58a26caa7db09669acf' 'caabe467168af9e44cf380af1abfe280')


package() {
	#prepare dirs
	mkdir -p ${pkgdir}/opt
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/licenses/
	mkdir -p ${pkgdir}/usr/share/applications/
	
  
	cp -a ${srcdir}/VESTA-${CARCH} ${pkgdir}/opt/VESTA
	chmod 755 ${pkgdir}/opt/VESTA
	
	#install executable
		install -m 755 ${srcdir}/VESTA ${pkgdir}/usr/bin
		
	#install desktop file
	install -m 644 ${srcdir}/VESTA.desktop ${pkgdir}/usr/share/applications/

	#link licence
	(	cd ${pkgdir}/usr/share/licenses/
		ln -sf ../../../opt/VESTA/Library_License VESTA
	)
}
