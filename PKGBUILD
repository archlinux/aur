# Maintainer: Jimmy Stelzer <jimmy.stelzer@gmail.com>

_pyname=mbed-host-tests
pkgname=python-${_pyname}
pkgver=1.3.1
pkgrel=1
pkgdesc="ARM mbed flash, reset and supervise tool"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=('python2' 'python2-pyserial' 'python2-prettytable' 'python-mbed-ls' 'python2-requests' 'python2-intelhex' 'pyocd')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/ARMmbed/htrun/archive/v$pkgver.tar.gz")
sha256sums=('cbf83d6ec8c9b9943e8bc98b258a5b80bfc477a5595498ffdb647c23e805d3ff')

package() {
  cd "$srcdir/htrun-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/test
}

# vim:set ts=2 sw=2 et:
