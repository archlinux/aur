pkgname=python2-libfsntfs
_pkgcode=libfsntfs
pkgver=20160109
pkgrel=1
pkgdesc=" Library and tools to access the New Technology File System (NTFS)" 
url="https://github.com/libyal/libfsntfs/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=2674915e10ae43a03e7f1aba7366ef40
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
