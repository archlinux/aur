# Maintainer: Keith Scheiwiller <k.scheiw@gmail.com>

_pyver="python2"
pkgname=python2-scruffington
pkgver=0.3.8.2
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
sha256sums=('36bd10f44a5329590e4ea7a6746645c1f9fa05d03b62c8c713676c65dbff2392')

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
