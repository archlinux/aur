pkgname=python2-libsigscan
_pkgcode=libsigscan
pkgver=20160109
pkgrel=1
pkgdesc="Library for binary signature scanning." 
url="https://github.com/libyal/libsigscan/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=66afaa1aeccacf67534ab1691d5b8f9c
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
