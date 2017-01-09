# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>
pkgname=camfr
pkgver=20070717
pkgrel=1
pkgdesc="CAMFR (CAvity Modelling FRamework) is a fast, flexible, friendly full-vectorial Maxwell solver."
arch=('x86_64')
url="http://camfr.sourceforge.net/"
license=('GPL')
depends=('python2-numpy'
         'python2-scipy'
         'python2-matplotlib'
         'python2-imaging'
         'tk')
makedepends=('scons'
             'gcc-fortran'
             'openblas-lapack'
             'blitz')
source=('git+https://github.com/jtambasco/camfr.git'
        'machine_cfg.py')
md5sums=('SKIP'
         db07413af39b15ff25d35b8dd89f2452)

build() {
  cd "${pkgname}_${pkgver}"
  mv ../machine_cfg.py .
  python2 setup.py build
}

package() {
  cd "${pkgname}_${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
