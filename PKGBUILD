# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-cbeams-git
pkgver=r122.da823c2
pkgrel=1
pkgdesc="A command-line program which draws pretty animated colored circles in
the terminal."
arch=('x86_64')
url='https://github.com/tartley/cbeams'
license=('BSD-3-Clause')
depends=('python' 'python-docopt' 'python-blessings')
optdepends=()
makedepends=('python' 'python-setuptools')
_pkgname=cbeams
source=("$_pkgname::git+https://github.com/tartley/cbeams")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
