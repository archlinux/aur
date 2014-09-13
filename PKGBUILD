# Maintainer: Ian D, Scott <ian@perebruin.com>
pkgname=python-pympv-git
pkgver=r77.8ba9b61
pkgrel=1
pkgdesc="A python wrapper for libmpv."
arch=('i686' 'x86_64')
url="https://github.com/ids1024/wikicurses"
license=('gpl')
depends=('python' 'python-urwid')
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
