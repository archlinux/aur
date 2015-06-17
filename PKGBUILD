# $Id: PKGBUILD, 2010/05/3$
# Maintainer: Maxime de Roucy <maxime.deroucy@gmail.com>
# Contributor: Maxime de Roucy <maxime.deroucy@gmail.com>
pkgname=cpp2dia
pkgver=1.2.0
pkgrel=4
pkgdesc="create UML diagrams for the diagram creation program \"Dia\" from an existing C++ source"
arch=(i686 x86_64)
url="http://cpp2dia.sourceforge.net/"
license=('zlib/libpng')
depends=('tcl>=8.3' 'graphviz>=1.8' 'dia>=0.88.1' 'ctags>=5.4')
install=('cpp2dia.install')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"cpp2dia.patch")
md5sums=('0c5b5c4e6869f79e58ffa0fde42585d6'
         'e948cd4fc5b34ec1df0579118ad18612')

package() {
	cd $srcdir/$pkgname

	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/${pkgname}/

	patch < ../${pkgname}.patch

	cp *.tcl $pkgdir/usr/share/${pkgname}/
	cp ${pkgname}.tclsh $pkgdir/usr/share/${pkgname}/

	ln -s /usr/share/${pkgname}/${pkgname}.tclsh $pkgdir/usr/bin/${pkgname}
}
