pkgname=python2-pytsk3
_pkgcode=pytsk3
pkgver=20160312
pkgrel=1
pkgdesc="Python bindings for the sleuthkit (http://www.sleuthkit.org/)" 
url="https://github.com/py4n6/pytsk/"
arch=('any')
license=('Apache')

depends=('sleuthkit')
makedepends=('python2' 'sleuthkit' 'gcc')

md5sum=cd3fc10de37503f6c83659a105b3b76d
source=(https://pypi.python.org/packages/source/p/$_pkgcode/$_pkgcode-$pkgver.tar.gz#md5=$md5sum)
md5sums=($md5sum)

build() {
  cd $srcdir/${_pkgcode}-${pkgver}

  python2 setup.py build
}

package() {
  cd $srcdir/${_pkgcode}-${pkgver}
  python2 setup.py install --root="${pkgdir}"
}
