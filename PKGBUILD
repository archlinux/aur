pkgname=python2-libbde
_pkgcode=libbde
pkgver=20160119
pkgrel=1
pkgdesc="Library and tools to access the BitLocker Drive Encryption (BDE) encrypted volumes" 
url="https://github.com/libyal/libbde/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=dff1506bd61db422a92100677e70ba07
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
