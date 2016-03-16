pkgname=python2-libevtx
_pkgcode=libevtx
pkgver=20151206
pkgrel=1
pkgdesc=" Library and tools to access the Windows XML Event Log (EVTX) format ." 
url="https://github.com/libyal/libevtx/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=b22ae1f91de3d57b3288fadef8666a29
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
