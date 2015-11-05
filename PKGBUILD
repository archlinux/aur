# Maintainer: Allen Choong <allen.choong at gmail dot com>
pkgname=klatexformula
pkgver=3.3.0beta
pkgrel=1
pkgdesc="Provides GUI for generating images from LaTeX equations"
url='http://klatexformula.sourceforge.net'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('automoc4' 'kdelibs' 'kdebase-runtime')
source=("http://sourceforge.net/projects/klatexformula/files/klatexformula/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('0458282acadeb52e50e4d4148f41c592')
install="${pkgname}.install"

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	sed -i "s|(uninstall|(uninstall2|" cmake/klfinstallpaths.cmake
	mkdir build && cd build
	cmake ..
	make DESTDIR="${pkgdir}/" install
}
