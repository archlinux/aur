# Maintainer:  <clu>

pkgname=python2-pyds9
_pkgname=pyds9
pkgver=1.8
pkgrel=2
pkgdesc="A Python Connection to DS9 via XPA"
url="http://hea-www.harvard.edu/RD/ds9/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python2')
makedepends=('python2' 'python2-distribute' 'libxt')
optdepends=('ds9-bin: astronomical data visualization application')
conflicts=()
replaces=()
backup=()
source=(https://github.com/ericmandel/pyds9/archive/v${pkgver}.tar.gz)
sha1sums=('59904d9623dd0f121b815a5cb9253cb94045978d')


build() {
  cd $srcdir/pyds9-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/pyds9-$pkgver
  python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1 
}
