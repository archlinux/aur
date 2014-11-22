# Maintainer: Ian D, Scott <ian@perebruin.com>
pkgname=wikicurses-git
pkgver=r285.1a7cd75
pkgrel=1
pkgdesc="A simple curses interface for accessing Wikipedia."
arch=('any')
url="https://github.com/ids1024/wikicurses"
license=('mit')
depends=('python' 'python-urwid' 'python-beautifulsoup4')
backup=('etc/wikicurses.conf')
source=('git://github.com/ids1024/wikicurses.git')
md5sums=('SKIP')
_gitname="wikicurses"

pkgver () {
  cd $srcdir/$_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
