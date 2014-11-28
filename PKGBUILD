# Maintainer: Ian D, Scott <ian@perebruin.com>
pkgname=python-pympv-git
pkgver=r83.95efe30
pkgrel=1
pkgdesc="A python wrapper for libmpv."
arch=('i686' 'x86_64')
url="https://github.com/andre-d/pympv"
license=('gpl')
depends=('python')
makedepends=('cython')
source=('git://github.com/andre-d/pympv.git')
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
