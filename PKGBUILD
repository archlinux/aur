# Maintainer: Keith Scheiwiller <k.scheiw@gmail.com>

_pyver="python2"
pkgname=python2-scruffy
pkgver=0.3.6
pkgrel=1
pkgdesc="Scruffy is a framework for taking care of a bunch of boilerplate in Python apps."
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
sha256sums=('98b9933bbe3a642d21f2de87f392dbe1151ca63d62573634b588e02fe8ef1723')

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
