# Maintainer: Jimmy Stelzer <jimmy.stelzer@gmail.com>

_pyname=mbed-ls
pkgname=python-${_pyname}
pkgver=1.6.0
pkgrel=1
pkgdesc="ARM mbed device detection module"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=('python2' 'python2-prettytable' 'python2-fasteners' 'python2-appdirs')
makedepends=('python2-setuptools')
optdepends=('python2-colorlog')
options=(!emptydirs)
source=("https://github.com/ARMmbed/mbed-ls/archive/release-version-$pkgver.tar.gz")
sha256sums=('c12e5bfbe37f5f8e45dbf427c5a16e92d900c3672eb116e586610a93da775d15')

package() {
  cd "$srcdir/${_pyname}-release-version-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/test
}

# vim:set ts=2 sw=2 et:
