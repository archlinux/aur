# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako-git
_gitname=tako
pkgver=0.2.5
pkgrel=2
pkgdesc="A command language and shell based on Python"
arch=('any')
url="https://gitlab.com/adqm/$_gitname"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools' 'git')
conflicts=('tako')
install=tako.install
source=("git+https://gitlab.com/adqm/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root=$pkgdir
}
