pkgname=python2-libvmdk
_pkgcode=libvmdk
pkgver=20160119
pkgrel=1
pkgdesc="Library and tools to access the VMware Virtual Disk (VMDK) format" 
url="https://github.com/libyal/libvmdk/"
arch=('any')
license=('LGPLv3+')

depends=('python2')
makedepends=('python2' 'gcc')

md5sum=f452aac879dd2cde85da58ec949b2844
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
