# Maintainer: gladon4 <mcgoldhand at gmail dot com>
pkgname=python-qt-themes
pkgver=0.3.0
pkgrel=1
pkgdesc="This is a collection of themes for Qt in Python."
arch=('any')
url="https://github.com/beatreichenbach/qt-themes"
license=('MIT')  
depends=(
  'python'
  'pyside6'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-flit-core'
)
source=(
  "python-qt-themes-${pkgver}.tar.gz::https://github.com/beatreichenbach/qt-themes/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('SKIP')  

build() {
  cd "$srcdir/qt-themes-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/qt-themes-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}