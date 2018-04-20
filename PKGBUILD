# Maintainer: Jimmy Stelzer <jimmy.stelzer@gmail.com>

_pyname=mbed-ls
pkgname=python-${_pyname}
pkgver=1.4.2
pkgrel=1
pkgdesc="ARM mbed device detection module"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=('python2' 'python2-prettytable' 'python2-fasteners' 'python2-appdirs')
makedepends=('python2-setuptools')
optdepends=('python2-colorlog')
options=(!emptydirs)
source=("https://github.com/ARMmbed/mbed-ls/archive/v$pkgver.tar.gz")
sha256sums=('a65cfad3e9b0ba33a69da540b4058a96f4079389c351b184e964539ef654640c')

package() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm -rf $pkgdir/usr/lib/python2.7/site-packages/test
}

# vim:set ts=2 sw=2 et:
