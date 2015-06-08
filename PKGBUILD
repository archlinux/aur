# Maintainer: Gianluca Montecchi <gian@grys.it>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>
# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=pyqglviewer
_pkgname=libQGLViewer
_pglname=PyQGLViewer
_pkgver=2.3.17
pkgver=0.11
pkgrel=4
pkgdesc="Python binding for libQGLViewer C++ library"
url="http://pyqglviewer.gforge.inria.fr/wiki/doku.php"
depends=('qt4' 'python2' 'python2-opengl' 'glu' 'mesa' 'python2-pyqt')
makedepends=('patch' 'python2')
arch=('i686' 'x86_64')
license=('GPL2' 'GPL3' 'custom')
options=(!makeflags) 
source=(
        https://gforge.inria.fr/frs/download.php/30908//${_pglname}-${pkgver}.zip
        https://gforge.inria.fr/frs/download.php/30907/${_pkgname}-${_pkgver}-py.tgz)
	
md5sums=('cc7d847989fd6af9ac51736cec864e4b'
         '75bc31ba4742d5fd9ddf5abba3bfa532')

build() 
{
#		cd $srcdir/${_pkgname}-${_pkgver}-py
		# dos2unix?
#		qmake-qt4 -o Makefile ${_pkgname}-${_pkgver}.pro || return 1
		
#		make install INSTALL_ROOT="$pkgdir"

#		# Install license.
#		cd $srcdir/${_pkgname}-${_pkgver}-py
#		install -d -m 0755 "${pkgdir}"/usr/share/licenses/$_pkgname/ || return 1
#		install -m 0644 licence.txt GPL_exception.txt "${pkgdir}"/usr/share/licenses/$_pkgname/ || return 1

		# PyQGLViewer
		cd $srcdir/$_pglname
		python2 configure.py -Q ../${_pkgname}-${_pkgver}-py --extra-libs GLU
}


package()
{
		make
		make install DESTDIR=$pkgdir

}
