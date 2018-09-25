# Maintainer: Jimmy Stelzer <jimmy.stelzer@gmail.com>

_pyname=mbed-host-tests
pkgname=python-${_pyname}
pkgver=1.4.1
pkgrel=1
pkgdesc="ARM mbed flash, reset and supervise tool"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=('python2' 'python2-pyserial' 'python2-prettytable' 'python-mbed-ls' 'python2-requests' 'python2-intelhex' 'pyocd')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://github.com/ARMmbed/htrun/archive/release-version-$pkgver.tar.gz")
sha256sums=('bd83ac73c7e1b196be233bf8830e66b89a8c6a78bc7047f07de92830d350e288')

package() {
  cd "$srcdir/htrun-release-version-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/test
}

# vim:set ts=2 sw=2 et:
