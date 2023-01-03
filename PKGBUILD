# Maintainer:  <clu>

pkgname=python-pyds9
_pkgname=pyds9
pkgver=1.8.1
pkgrel=1
pkgdesc="A Python Connection to DS9 via XPA"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python')
makedepends=('python' 'python-distribute' 'libxt')
optdepends=('ds9-bin: astronomical data visualization application'
            'ds9: astronomical data visualization application')
conflicts=()
replaces=()
backup=()
source=(https://github.com/ericmandel/pyds9/archive/v${pkgver}.tar.gz)
sha1sums=('ed8d86d01b4cbb0ad91ed42a0de99efd17b3ab7d')


build() {
  cd $srcdir/pyds9-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/pyds9-$pkgver
  python setup.py install --root=$pkgdir --prefix=/usr --optimize=1 
}

