# Maintainer: Keith Scheiwiller <k.scheiw@gmail.com>

_pyver="python2"
pkgname=python2-scruffy
pkgver=0.3.1
pkgrel=1
pkgdesc="Handles the loading and management of configuration files, plugins, and other filesystem resources such as temporary files and directories, log files, etc. "
arch=('any')
depends=("${_pyver}"
         "${_pyver}-pyyaml"
         "${_pyver}-six"
         "${_pyver}-sqlalchemy")
makedepends=("${_pyver}-setuptools")
url="https://github.com/snare/scruffy"
license=('Beerware')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/snare/scruffy/tar.gz/v$pkgver)
sha256sums=('fe01da3267d16b7e416697072ac25f73c36be4d32813cf1ce92a5cc845fcecf3')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Building...'
  ${_pyver} setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  ${_pyver} setup.py install --root="$pkgdir" --optimize=1
}
