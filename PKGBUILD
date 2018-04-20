# Maintainer: Jimmy Stelzer <jimmy.stelzer@gmail.com>

_pyname=mbed-greentea
pkgname=python-${_pyname}
pkgver=1.3.3
pkgrel=1
pkgdesc="ARM mbed test automation"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=('python2' 'python2-prettytable' 'python2-colorama' 'python2-pyserial' 'python-mbed-ls' 'python2-junit-xml' 'python2-lockfile' 'python2-mock' 'python2-six' 'python-mbed-host-tests')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/ARMmbed/greentea/archive/v$pkgver.tar.gz")
sha256sums=('376b4f196b9a020e255fc49f06b1981912adde4fa1cfc30f860c552847ec28a3')

package() {
  cd "$srcdir/greentea-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/test
}

# vim:set ts=2 sw=2 et:
