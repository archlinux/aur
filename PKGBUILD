# Maintainer: robertfoster

pkgname=python-dmidecode
pkgver=3.12.3
pkgrel=1
arch=('i686' 'x86_64')
url="https://git.fedorahosted.org/cgit/python-dmidecode.git"
pkgdesc="Python module to access DMI data"
license=('GPL2')
depends=('python' 'dmidecode' 'libxml2' 'python-lxml')
makedepends=('python' 'libxml2')
source=("https://github.com/nima/python-dmidecode/archive/v$pkgver.tar.gz")

package() {
  cd $srcdir/$pkgbase-${pkgver}
  sed -i 's/python2/python3/g' Makefile unit-tests/Makefile
  export CFLAGS+=" -std=gnu89"
  make build
  python src/setup.py install --root=$pkgdir

}

sha256sums=('44d45d7d8344290c259c989d3af3f614c7837cbd85052d486adfa46a1c777164')
