# Maintainer: Joao Freitas <joaj dot freitas at gmail dot com>

pkgname=procal-git
pkgver=96173f72
pkgrel=1
pkgdesc='Simple Qt-based programming calculator'
arch=('x86_64')
url='https://github.com/joajfreitas/procal'
license=('GPLv3')
depends=('python' 'python-pyqt6' 'python-pyqt6-sip' 'python-pyqtdarktheme')
optdepends=()
makedepends=('python' 'python-setuptools' 'git')
provides=('procal')
_pkgname=procal
source=("${_pkgname}::git+https://github.com/joajfreitas/procal")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git rev-parse HEAD | head -c8)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

