# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=python2-pyngl
pkgver=1.4.0
pkgrel=1
pkgdesc="PyNGL is a Python language module used to visualize scientific visualization and data analysis, with an emphasis on high quality 2D visualizations. A working knowledge of Python is assumed."
url="http://www.pyngl.ucar.edu"
license=('custom:PyNGL Source Code License')
arch=('i686' 'x86_64')
depends=('ncl' 'cairo' 'python2-pynio' 'python2' 'python2-numpy')
makedepends=('glibc' 'gcc' 'gcc-fortran' 'zlib' 'libpng' 'libx11' 'freetype2')
provides=('pyngl')
source=("http://dl.dropbox.com/u/3383807/PyNGL-${pkgver}.tar.gz")
md5sums=('12bf3c977619fa065dcfeec9f2b247c9')

package() {
  
  echo -e "\nSorry, this version not compile with ncl v6.x, wait until release pyngl v1.5\n"
  exit
  
  cd $srcdir/PyNGL-${pkgver}
  
  export HAS_CAIRO=1
  
  export PNG_PREFIX=/usr/lib
  export ZLIB_PREFIX=/usr/lib
  export CAIRO_PREFIX=/usr/lib
  export FREETYPE_PREFIX=/usr/lib
  
  export F2CLIBS=gfortran
  export F2CLIBS_PREFIX=/usr/lib

  #sed -i 's|#include "gsun.h"||g' hlu_wrap.c
  
  python2 setup.py install --root=${pkgdir}
  
}
