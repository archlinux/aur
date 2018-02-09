# Maintainer: Techmeology <techmeology@techmeology.co.uk>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Based on python2-miniupnpc AUR package

pkgname=python-miniupnpc
pkgver=2.0.20180203
pkgrel=2
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices"
arch=('i686' 'x86_64')
depends=('python')
makedepends=('python-setuptools')
url="http://miniupnp.free.fr"
license=('custom')
options=(!emptydirs)
source=(http://miniupnp.free.fr/files/${pkgname#python-}-${pkgver}.tar.gz)
md5sums=('48fd9c899f77e898c74d2166590da076')

build() {
  cd $srcdir/${pkgname#python-}-$pkgver
  msg 'Building...'
  make
  python setup.py build
}

package() {
  cd $srcdir/${pkgname#python-}-$pkgver
  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
