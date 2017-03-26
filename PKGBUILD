# Maintainer: Keith Scheiwiller <k.scheiw@gmail.com>

_pyver="python2"
pkgname=python2-scruffington
pkgver=0.3.7
pkgrel=1
pkgdesc="Framework for taking care of a bunch of boilerplate in Python apps."
arch=('any')
depends=("${_pyver}"
         "${_pyver}-yaml"
         "${_pyver}-six"
         "${_pyver}-sqlalchemy")
makedepends=("${_pyver}-setuptools")
url="https://github.com/snare/scruffy"
license=('MIT')
options=('!emptydirs')
source=(scruffy-$pkgver.tar.gz::https://codeload.github.com/snare/scruffy/tar.gz/v$pkgver)
sha256sums=('43671fcc6428533e68773490eec55e54a2dd205adbbd067bb5057ddff6ed0595')

build() {
  cd "$srcdir/scruffy-$pkgver"

  msg 'Building...'
  ${_pyver} setup.py build
}

package() {
  cd "$srcdir/scruffy-$pkgver"

  msg 'Installing...'
  ${_pyver} setup.py install --root="$pkgdir" --optimize=1
}
