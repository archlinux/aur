# Maintainer: Jimmy Stelzer <jimmy.stelzer@gmail.com>

_pyname=mbed-ls
pkgname=python-${_pyname}
pkgver=1.7.8
pkgrel=1
pkgdesc="ARM mbed device detection module"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=('python2' 'python2-prettytable' 'python2-fasteners' 'python2-appdirs')
makedepends=('python2-setuptools')
optdepends=('python2-colorlog')
options=(!emptydirs)
source=("https://github.com/ARMmbed/mbed-os-tools/archive/v0.0.9.tar.gz")
sha256sums=('a2ad7f6c8a58ee9150873540a1f1f54f147f1020b86fe8f54bd4defed6b25471')

package() {
  cd "$srcdir/mbed-os-tools-0.0.9/packages/mbed-ls"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/test
}

# vim:set ts=2 sw=2 et:
