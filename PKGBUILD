# Maintainer: Keith Scheiwiller <k.scheiw@gmail.com>

_pyver="python2"
pkgname=python2-rl
pkgver=2.4
pkgrel=1
pkgdesc="Alternative Python bindings for GNU Readline"
arch=('i686' 'x86_64')
depends=("${_pyver}" "readline")
makedepends=("${_pyver}-setuptools")
url="https://github.com/stefanholek/rl"
license=('GPL' 'PSFL')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/r/${pkgname#python2-}/${pkgname#python2-}-$pkgver.zip)
md5sums=('206512834d837e9cdde81e6cf7e8fca4')
sha256sums=('3acc0fd8cc5ba7ece7af5543035fb3c3f6f424db01c2d6cd420ef964a736b6f4')

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  ${_pyver} setup.py install --root="$pkgdir" --optimize=1
}
