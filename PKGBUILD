# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yade
pkgver=2022.01a
pkgrel=2
pkgdesc="Yet Another Dynamic Engine, free software for discrete element modeling."
arch=("x86_64")
url='https://yade-dem.org/doc/index.html'
license=('GPL2')
depends=(
    'cgal' 'coin-or-clp' 'freeglut' 'gl2ps'
    'gts' 'ipython' 'libqglviewer' 'openmpi' 
    'python-mpmath' 'python-xlib' 'python-future' 'python-pyqt5'
    'vtk'
)

optdepends=(
'cuda: GPU acceleration'
'python-matplotlib: plotting graphs' 
'python-mpi4py: passing all tests' 
'tk: passing all tests' 
)
source=("${pkgname}-${pkgver}.tar.gz::https://dl.sukanka.com/ali/software/yade/yade-${pkgver}-2-x86_64.tar.gz"
)
sha512sums=('d75864a5f53130bd4f7f90107ce8fd5953afcf0ee55e65446b44374dbc57ac92f8c118b1e40f48622dee82344fee8ace912186eae9d00359b0fad4e3391ed47a')

package(){
   mv $srcdir/usr ${pkgdir}
   
   # Fix manpage
   cd ${pkgdir}/usr/share/man
   mkdir man1
   mv yade* man1
}
