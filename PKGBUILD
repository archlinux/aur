# Maintainer: M0Rf30

pkgbase=python-dmidecode
pkgname=('python-dmidecode' 'python2-dmidecode')
pkgver=3.12.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://git.fedorahosted.org/cgit/python-dmidecode.git"
license=('GPL2')
makedepends=('python' 'python2')
source=("https://github.com/nima/python-dmidecode/archive/v$pkgver.tar.gz")

package_python-dmidecode() {
depends=('python' 'dmidecode')

pkgdesc="Python module to access DMI data"
  cd $srcdir/$pkgbase-${pkgver}/
  make build
  make dmidump

  python src/setup.py install --root=$pkgdir/ 

}

package_python2-dmidecode() {
depends=('python2' 'dmidecode')
pkgdesc="Python module to access DMI data"
  cd $srcdir/$pkgbase-${pkgver}
  make build
  make dmidump

  python2 src/setup.py install --root=$pkgdir/  

}

md5sums=('458d83ac45316ec40df327b183b2030e')
