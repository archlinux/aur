pkgname=python2-liblnk
_pkgcode=liblnk
pkgver=20151205
pkgrel=1
pkgdesc="Library and tools to access the Windows Shortcut File (LNK) format" 
url="https://github.com/libyal/liblnk/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=e1bc3423fb60fc4d365e2ab094b97a39
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
