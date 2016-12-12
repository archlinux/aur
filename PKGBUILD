# Maintainer: Ian D, Scott <ian@perebruin.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=python-pympv-git
pkgver=r107.2a5401b
pkgrel=1
pkgdesc="A python wrapper for libmpv."
arch=('i686' 'x86_64')
url="https://github.com/marcan/pympv"
license=('gpl')
depends=('python')
makedepends=('cython')
provides=('python-pympv')
conflicts=('python-pympv')
source=('git://github.com/marcan/pympv.git')
md5sums=('SKIP')
_gitname="pympv"

pkgver () {
  cd $srcdir/$_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
