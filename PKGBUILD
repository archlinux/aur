# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=python-fastrpc-git
_gitname=fastrpc
pkgver=python8.0.1
pkgrel=1
pkgdesc="Python FastRPC library"
url="https://github.com/seznam/fastrpc"
arch=('any')
license=('GPL')
depends=('python' 'fastrpc-git')
makedepends=('python-setuptools' 'python-debian')
source=("git://github.com/seznam/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname/python"
  python setup.py install --root=$pkgdir
}

