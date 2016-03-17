pkgname=python2-libvshadow
_pkgcode=libvshadow
pkgver=20160110
pkgrel=1
pkgdesc="Library and tools to access the Volume Shadow Snapshot (VSS) format" 
url="https://github.com/libyal/libvshadow/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=8c3117918a91bebeff20d1fd2ee1a7a6
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
