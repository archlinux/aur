pkgname=python2-libqcow
_pkgcode=libqcow
pkgver=20160119
pkgrel=1
pkgdesc="ibrary and tools to access the QEMU Copy-On-Write (QCOW) image format" 
url="https://github.com/libyal/libqcow/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=96b1188e693ab3dd97d49d9fe69d3d07
source=(https://pypi.python.org/packages/source/l/$_pkgcode-python/$_pkgcode-python-$pkgver.tar.gz#md5=$md5sum)
md5sums=($md5sum)

build() {
  cd $srcdir/${_pkgcode}-${pkgver}

  python2 setup.py build
}

package() {
  cd $srcdir/${_pkgcode}-${pkgver}
  python2 setup.py install --root="${pkgdir}"
}
