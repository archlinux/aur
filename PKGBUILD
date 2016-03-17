pkgname=python2-libsmraw
_pkgcode=libsmraw
pkgver=20151219
pkgrel=1
pkgdesc="Library and tools to access the (split) RAW image format" 
url="https://github.com/libyal/libsmraw/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=fdf655999e42183ba8c941128a3aca3f
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
