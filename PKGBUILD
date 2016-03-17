pkgname=python2-libvhdi
_pkgcode=libvhdi
pkgver=20151220
pkgrel=1
pkgdesc="Library and tools to access the Virtual Hard Disk (VHD) image format" 
url="https://github.com/libyal/libvhdi/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=d7e90dce45125825519b16c86d3fb3be
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
