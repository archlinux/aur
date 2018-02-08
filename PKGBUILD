# Maintainer: Techmeology <techmeology@techmeology.co.uk>
# Based on python2-miniupnpc AUR package

pkgname=python-miniupnpc
pkgver=2.0.20180203
pkgrel=1
pkgdesc="Repack of the original miniupnp project to facilitate install via PyPi"
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/chenhouwu/miniupnpc"
license=('custom')
options=(!emptydirs)
source=(http://miniupnp.free.fr/files/miniupnpc-${pkgver}.tar.gz)
md5sums=('48fd9c899f77e898c74d2166590da076')

prepare(){
  cd $srcdir/${pkgname#python-}-$pkgver

  msg 'Fixing Python version...'
}

build() {
  cd $srcdir/${pkgname#python-}-$pkgver

  msg 'Building...'
  python setup.py build
}

package() {
  cd $srcdir/${pkgname#python-}-$pkgver

  msg 'Installing license...'
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/python-miniupnpc/LICENSE

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
