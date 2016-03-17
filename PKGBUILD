pkgname=python2-libregf
_pkgcode=libregf
pkgver=20160109
pkgrel=1
pkgdesc="Library and tools to access the Windows NT Registry File (REGF) format" 
url="https://github.com/libyal/libregf/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=f406feed480b165f071017cf3afd98a1
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
