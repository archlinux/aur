# Maintainer: jdkaplan <jdkaplan@metagram.net>

pkgname=tako-git
_gitname=tako
pkgver=0.0.15
pkgrel=1
pkgdesc="A command language and shell based on Python"
arch=('any')
url="https://notabug.org/adqm/$_gitname"
license=('custom:Soopycat2')
depends=('python')
makedepends=('python-setuptools' 'git')
conflicts=('tako')
install=tako.install
source=("git+https://notabug.org/adqm/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license"
}
