pkgname=python2-libevt
_pkgcode=libevt
pkgver=20151206
pkgrel=1
pkgdesc="Library and tools to access the Windows Event Log (EVT) format." 
url="https://github.com/libyal/libevt/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=346f2e6cb320d6e3c1861cba3e924cf8
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
