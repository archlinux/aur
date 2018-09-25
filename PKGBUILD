# Maintainer: Jimmy Stelzer <jimmy.stelzer@gmail.com>

_pyname=mbed-greentea
pkgname=python-${_pyname}
pkgver=1.4.0
pkgrel=1
pkgdesc="ARM mbed test automation"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=('python2' 'python2-prettytable' 'python2-colorama' 'python2-pyserial' 'python-mbed-ls' 'python2-junit-xml' 'python2-lockfile' 'python2-mock' 'python2-six' 'python-mbed-host-tests')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/ARMmbed/greentea/archive/release-version-$pkgver.tar.gz")
sha256sums=('6d816e6b6828117397ee9de5ea65bfb42c00f6fa223f6c8cdcc29161374e256c')

package() {
  cd "$srcdir/greentea-release-version-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/test
}

# vim:set ts=2 sw=2 et:
