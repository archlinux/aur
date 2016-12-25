# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>
pkgname=camfr
pkgver=20070717
pkgrel=1
pkgdesc="CAMFR (CAvity Modelling FRamework) is a fast, flexible, friendly full-vectorial Maxwell solver."
arch=('x86_64')
url="http://camfr.sourceforge.net/"
license=('GPL')
depends=('python2-scipy'
         'python2-imaging')
makedepends=('scons'
             'gcc-fortran'
             'openblas-lapack'
             'blitz')
source=('http://downloads.sourceforge.net/project/camfr/camfr/camfr-20070717/camfr-20070717.tgz'
        'machine_cfg.py')
md5sums=(3858d6b9e3be29aa3981c2b4fe595fe2
         db07413af39b15ff25d35b8dd89f2452)

build() {
  cd "${pkgname}_${pkgver}"
  mv ../machine_cfg.py .
  python2 setup.py build
}

package() {
  cd "${pkgname}_${pkgver}"
  python2 setup.py install --root
}
