# Maintainer: Masoud <mpoloton@gmail.com>

pkgname=('python-nibabel')
pkgver=2.1.0
pkgrel=1
pkgdesc="Python library for reading and writing of some common neuroimaging file formats"
arch=('i686' 'x86_64')
url="http://nipy.org/nibabel"
license=('MIT')
depends=( 'python'
          'python-numpy>=1.5'
          'python-scipy' 
          'python-pillow' 
          'python-pydicom' )
makedepends=('python-setuptools' 'python-nose' 'python-mock')
source=("https://github.com/nipy/nibabel/archive/${pkgver}.tar.gz")
md5sums=('f6e213894939aece4619e3a45259dfbd')


build() {
  msg "Building ..."
  cd "$srcdir/nibabel-${pkgver}"
  python setup.py build
}


package_python-nibabel() {

  cd "$srcdir/nibabel-${pkgver}"

  python setup.py install --skip-build --root="$pkgdir" --optimize=1

}
